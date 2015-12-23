//  Artwork_screen.h
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/22/15.
//  Copyright © 2015 Artsy. All rights reserved.

#import "Basic_screen.h"

@interface Artwork_screen : Basic_screen {
    
    UIView *_artistView;
    NSString *_artistTextView;
}

-(id)getArtistOfArtwork;

@end
