#import "Basic_screen.h"

@implementation Basic_screen (Navigation)

static NSString *homeButton = @"HomeButton";

-(void)navigateToHomePage {
    
    [tester tapViewWithAccessibilityLabel:homeButton];
}

@end
