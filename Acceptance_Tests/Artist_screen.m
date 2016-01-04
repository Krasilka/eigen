#import "Artist_screen.h"

@implementation Artist_screen

-(NSString *)getArtistName {
    
    _artistNameView = [tester waitForViewWithAccessibilityLabel:@"Artist Full Name" traits:UIAccessibilityTraitStaticText];
    [_artistNameView isKindOfClass:[UILabel class]];
    _artistNameTextView = ((UILabel *)_artistNameView).text;
    
    return _artistNameTextView;
}

-(NSString *)getArtistInfo {
    
    _artistInfoView = [tester waitForViewWithAccessibilityLabel:@"Artist Info" traits:UIAccessibilityTraitStaticText];
    [_artistInfoView isKindOfClass:[UILabel class]];
    _artistInfoTextView = ((UILabel *)_artistInfoView).text;
    
    return _artistInfoTextView;
}

@end
