#import "Welcome_screen.h"
#import "KIFUITestActor+Helper.h"

@implementation Welcome_screen

static NSString *_withoutAccount = @"TRY WITHOUT AN ACCOUNT";

- (void)tryWithoutAccount {

    NSInteger obj = [tester existsViewWithAccessibilityLabel:@"SignUpButton"];
    switch (obj) {
        case 1:
            [tester tapViewWithAccessibilityLabel:_withoutAccount];
            break;
        case 0:
            [tester waitForViewWithAccessibilityLabel:@"HomeButton" traits:UIAccessibilityTraitSelected];
            break;
    }
}

@end
