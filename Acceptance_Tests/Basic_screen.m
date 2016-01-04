#import "Basic_screen.h"

@implementation Basic_screen

static NSString *searchButton = @"SearchButton";
static NSString *backButton = @"BackButton";

-(void)dismissAlert {
    [tester acknowledgeSystemAlert];
}

-(void)openSearch {
    [tester tapViewWithAccessibilityLabel:searchButton];
}

-(void)goBackToPreviousScreen {
    [tester tapViewWithAccessibilityLabel:backButton];
}

@end
