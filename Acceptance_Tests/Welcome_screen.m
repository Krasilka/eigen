//
//  Welcome_screen.h
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.
//

#import "Welcome_screen.h"

@implementation Welcome_screen

static NSString *_withoutAccount = @"TRY WITHOUT ACCOUNT";

-(void)tryWithoutAccount {
    if ([[[UIApplication sharedApplication] keyWindow] accessibilityElementWithLabel:@"SIGN UP"]) {
        [tester tapViewWithAccessibilityLabel:_withoutAccount];
    };
}

@end