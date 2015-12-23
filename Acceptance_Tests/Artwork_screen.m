//  Artwork_screen.m
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/22/15.
//  Copyright © 2015 Artsy. All rights reserved.

#import "Artwork_screen.h"

@implementation Artwork_screen

-(NSString *)getArtistOfArtwork {
    
    _artistView = [tester waitForViewWithAccessibilityLabel:@"Artist Of Artwork" traits:UIAccessibilityTraitStaticText];
    [_artistView isKindOfClass:[UILabel class]];
    _artistTextView = [[NSString alloc] initWithString:((UILabel *)_artistView).text];
    
    return _artistTextView;
}

@end
