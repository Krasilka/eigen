//  KIFUITestActor+Helper.m
//  Pods
//
//  Created by Kondel Iryna on 10/9/15.

#import "KIFUITestActor+Helper.h"
#import "UIAccessibilityElement-KIFAdditions.h"
#import "UIApplication-KIFAdditions.h"
#import "UIScrollView-KIFAdditions.h"

@implementation KIFUITestActor (Helper)

- (BOOL)accessibilityElementExists:(NSString *)label
{
    __block UIView *view = nil;
    
    BOOL showing = TRUE;
    
    @try
    {
        [self runBlockWithoutError:^KIFTestStepResult(NSError **error){
            error = nil;
            return [KIFUITestActor accessibilityElement:NULL view:&view withLabel:label value:nil traits:UIAccessibilityTraitNone tappable:NO] ? KIFTestStepResultSuccess : KIFTestStepResultWait;
        } timeout:1];
    }
    @catch (NSException *exception)
    {
        showing = FALSE;
    }
    
    return showing;
}

- (void)runBlockWithoutError:(KIFTestExecutionBlock)executionBlock timeout:(NSTimeInterval)timeout
{
    @autoreleasepool {
        NSDate *startDate = [NSDate date];
        KIFTestStepResult result;
        NSError *error = nil;
        
        while ((result = executionBlock(&error)) == KIFTestStepResultWait && -[startDate timeIntervalSinceNow] < timeout) {
            CFRunLoopRunInMode([[UIApplication sharedApplication] currentRunLoopMode] ?: kCFRunLoopDefaultMode, 0.1, false);
        }
        
        if (result == KIFTestStepResultWait)
        {
            result = KIFTestStepResultFailure;
        }
        
        if (result == KIFTestStepResultFailure)
        {
            NSException *e = [NSException exceptionWithName:@"KIF Extension Exception" reason:@"Could not find accessibility element" userInfo:nil];
            [e raise];
        }
    }
}

+ (BOOL)accessibilityElement:(out UIAccessibilityElement **)foundElement view:(out UIView **)foundView withLabel:(NSString *)label value:(NSString *)value traits:(UIAccessibilityTraits)traits tappable:(BOOL)mustBeTappable
{
    UIAccessibilityElement *element = [KIFUITestActor accessibilityElementWithLabel:label value:value traits:traits];
    
    UIView *view = [KIFUITestActor viewContainingAccessibilityElement:element tappable:mustBeTappable];
    
    return element || view;
}

+ (UIAccessibilityElement *)accessibilityElementWithLabel:(NSString *)label value:(NSString *)value traits:(UIAccessibilityTraits)traits;
{
    UIAccessibilityElement *element = [[UIApplication sharedApplication] accessibilityElementWithLabel:label accessibilityValue:value traits:traits];
    if (element) {
        return element;
    }
    
    element = [[UIApplication sharedApplication] accessibilityElementWithLabel:label accessibilityValue:nil traits:traits];
    // For purposes of a better error message, see if we can find the view, just not a view with the specified value.
    if (value && element) {
        return nil;
    }
    
    // Check the traits, too.
    element = [[UIApplication sharedApplication] accessibilityElementWithLabel:label accessibilityValue:nil traits:UIAccessibilityTraitNone];
    if (traits != UIAccessibilityTraitNone && element) {
        return nil;
    }
    
    return nil;
}

+ (UIView *)viewContainingAccessibilityElement:(UIAccessibilityElement *)element tappable:(BOOL)mustBeTappable
{
    // Small safety mechanism.  If someone calls this method after a failing call to accessibilityElementWithLabel:..., we don't want to wipe out the error message.
    if (!element) {
        return nil;
    }
    
    // Make sure the element is visible
    UIView *view = [UIAccessibilityElement viewContainingAccessibilityElement:element];
    if (!view) {
        return nil;
    }
    
    // Scroll the view to be visible if necessary
    UIScrollView *scrollView = (UIScrollView *)view;
    while (scrollView && ![scrollView isKindOfClass:[UIScrollView class]]) {
        scrollView = (UIScrollView *)scrollView.superview;
    }
    if (scrollView) {
        if ((UIAccessibilityElement *)view == element) {
            [scrollView scrollViewToVisible:view animated:YES];
        } else {
            CGRect elementFrame = [view.window convertRect:element.accessibilityFrame toView:scrollView];
            [scrollView scrollRectToVisible:elementFrame animated:YES];
        }
        
        // Give the scroll view a small amount of time to perform the scroll.
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.3, false);
    }
    
    if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
        return nil;
    }
    
    // If we don't require tappability, at least make sure it's not hidden
    if ([view isHidden]) {
        return nil;
    }
    
    if (mustBeTappable && !view.isProbablyTappable) {
        return nil;
    }
    
    return view;
}


@end
