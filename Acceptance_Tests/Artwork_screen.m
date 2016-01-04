#import "Artwork_screen.h"

@implementation Artwork_screen

-(NSString *)getArtistOfArtwork {
    
    _artistView = [tester waitForViewWithAccessibilityLabel:@"Artist Of Artwork" traits:UIAccessibilityTraitStaticText];
    [_artistView isKindOfClass:[UILabel class]];
    _artistTextView = [[NSString alloc] initWithString:((UILabel *)_artistView).text];
    
    return _artistTextView;
}

@end
