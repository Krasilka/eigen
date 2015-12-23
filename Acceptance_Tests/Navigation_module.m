//  Navigation_module.m
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.

#import "Navigation_module.h"

@implementation Navigation_module

static NSString *homeButton = @"HomeButton";

-(void)toHomePage {
    [tester tapViewWithAccessibilityLabel:homeButton];
}

@end
