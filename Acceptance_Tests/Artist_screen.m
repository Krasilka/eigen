//  Artist_screen.m
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/22/15.
//  Copyright © 2015 Artsy. All rights reserved.

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
