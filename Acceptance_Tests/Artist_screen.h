#import "Basic_screen.h"

@interface Artist_screen : Basic_screen {
    
    UIView *_artistNameView;
    NSString *_artistNameTextView;
    UIView *_artistInfoView;
    NSString *_artistInfoTextView;
}

-(id)getArtistName;
-(id)getArtistInfo;

@end
