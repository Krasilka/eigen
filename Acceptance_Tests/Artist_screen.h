//  Artist_screen.h
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/22/15.
//  Copyright © 2015 Artsy. All rights reserved.

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
