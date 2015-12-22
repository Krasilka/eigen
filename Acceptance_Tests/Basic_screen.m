//
//  Basic_screen.m
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.
//

#import "Basic_screen.h"

@implementation Basic_screen

static NSString *searchButton = @"SearchButton";
static NSString *backButton = @"BackButton";


-(void)openSearch {
    [tester tapViewWithAccessibilityLabel:searchButton];
}

-(void)goBackToPreviousScreen {
    [tester tapViewWithAccessibilityLabel:backButton];
}

@end
