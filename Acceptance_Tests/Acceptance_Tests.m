//
//  Acceptance_Tests.m
//  Acceptance_Tests
//
//  Created by Kondel Iryna on 10/9/15.
//  Copyright © 2015 Artsy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>


@interface Acceptance_Tests : KIFTestCase

@end

@implementation Acceptance_Tests

- (void) beforeAll {
    
    //In case if you start the test on device and there is alert message with push notifications
    if ([tester accessibilityElementExists:@"OK"]) {
        [tester tapViewWithAccessibilityLabel:@"OK"];
    }
    //    [UIAlertView alertViewWithTitle:@"" message:@"Submit successfully!" cancelBlock:^(NSInteger buttonIndex) {
    //    } dismissBlock:nil cancelButtonTitle:@"OK" otherButtonsTitles:nil, nil];
}

- (void) beforeEach {
    [self navigateToHomePage];
}

- (void) afterEach {
    //    Go back to Home page
    [tester tapViewWithAccessibilityLabel:@"HomeButton"];
    [self userIsOnHomePage];
}

- (void) navigateToHomePage {
    
    //this is the page only on 1st launch of app for the device
    if ([tester accessibilityElementExists:@"SIGN UP"]) {
        [tester tapViewWithAccessibilityLabel:@"TRY WITHOUT AN ACCOUNT"];
    }
    [self userIsOnHomePage];
}

- (void) userIsOnHomePage {
    //    [self navigateToHomePage];
    if ([tester accessibilityElementExists:@"EXPLORE"]) {
    }
    if ([tester accessibilityElementExists:@"CURRENT SHOWS"]) {
    }
}

- (void) navigateToSearchPage {
    [tester waitForTappableViewWithAccessibilityLabel:@"SearchButton"];
    [tester tapViewWithAccessibilityLabel:@"SearchButton"]; //search button should have SearchButton acc label, changed it in Artsy --> ViewControllers --> Search--> ARSearchViewController --> added access..Label
    
    // Verify that the login succeeded
    [tester waitForTappableViewWithAccessibilityLabel:@"CLOSE"];
}

//=======
// Tests
//=======

- (void) testSearchForAuthor {
    
    [self navigateToHomePage];
    [self navigateToSearchPage];
    [tester tapViewWithAccessibilityLabel:@"TextfieldClearButton"];
    [tester enterTextIntoCurrentFirstResponder:@"Kasimir Malevich"];
    
    // Verify that Clear text icon appeared
    [tester waitForTappableViewWithAccessibilityLabel:@"TextfieldClearButton"];
    
    // Verify that suggested search result appeared
    [tester waitForTappableViewWithAccessibilityLabel:@"Kasimir Severinovich Malevich"];
    [tester tapViewWithAccessibilityLabel:@"Kasimir Severinovich Malevich"];
    [tester waitForViewWithAccessibilityLabel:@"KASIMIR SEVERINOVICH MALEVICH"];
    [tester waitForViewWithAccessibilityLabel:@"Russian, 1879-1935"];
}

- (void) testSearchForArtwork {
    
    [self navigateToHomePage];
    [self navigateToSearchPage];
    
    if ([tester accessibilityElementExists:@"TextfieldClearButton"]) {
        [tester tapViewWithAccessibilityLabel:@"TextfieldClearButton"];
    }
    
    [tester enterTextIntoCurrentFirstResponder:@"Double Elvis"];
    
    // Verify that Clear text icon appeared
    [tester waitForTappableViewWithAccessibilityLabel:@"TextfieldClearButton"];
    
    // Verify that suggested search result appeared
    [tester waitForTappableViewWithAccessibilityLabel:@"Andy Warhol, Double Elvis (1963/1976)"];
    [tester tapViewWithAccessibilityLabel:@"Andy Warhol, Double Elvis (1963/1976)"];
    [tester waitForTappableViewWithAccessibilityLabel:@"ANDY WARHOL"];
}

@end
