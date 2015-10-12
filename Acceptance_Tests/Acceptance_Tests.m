//
//  Acceptance_Tests.m
//  Acceptance_Tests
//
//  Created by Kondel Iryna on 10/9/15.
//  Copyright © 2015 Artsy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "Specta/Specta.h"
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>


SpecBegin (Acceptance_Tests)

describe(@"Acceptance_Tests", ^{
    
    //    beforeAll( ^{
    //              if ([tester accessibilityElementExists:@"SIGN UP"]) {
    //                  [tester tapViewWithAccessibilityLabel:@"TRY WITHOUT AN ACCOUNT"];
    //              };
    //
    //    });
    //
        beforeEach(^{
    //
    //        it(@"Navigates to Home page", ^{
    //            [tester tapViewWithAccessibilityLabel:@"HomeButton"];
    //            if ([tester accessibilityElementExists:@"EXPLORE"]) {
    //                expect(@"EXPLORE").to.beTruthy();
    //            }
    //            else
    //                expect([tester accessibilityElementExists:@"CURRENT SHOWS"]).to.equal(YES);
    //        });
    //
    //        it(@"Navigates to Search page", ^{
                [tester tapViewWithAccessibilityLabel:@"SearchButton"];
    //            expect(@"Button").to.equal(@"CLOSE");
    //        });
    //
    //        it(@"Clears input search field", ^{
    //
    //        });
        });
    //
    
    
    it(@"SearchArtwork", ^{
        
//        //        navigates to home page
//        [tester tapViewWithAccessibilityLabel:@"HomeButton"];
//        
//        if ([tester accessibilityElementExists:@"EXPLORE"]){
//            expect([tester accessibilityElementExists:@"CURRENT SHOWS"]).to.equal(YES);
//        }
//        else
//            expect([tester accessibilityElementExists:@"CURRENT SHOWS"]).to.equal(YES);
//        
//        
//        //        navigates to search page
//        [tester tapViewWithAccessibilityLabel:@"SearchButton"];
        
        
        //        clears text field if needed
        if ([tester accessibilityElementExists:@"TextfieldClearButton"]) {
            [tester tapViewWithAccessibilityLabel:@"TextfieldClearButton"];
        }
        
        //        test
        [tester enterText:@"Double Elvis" intoViewWithAccessibilityLabel:@"SearchField"];
        [tester tapViewWithAccessibilityLabel:@"Andy Warhol, Double Elvis (1963/1976)"];
        expect([tester accessibilityElementExists:@"ANDY WARHOL"]).to.equal(YES);
        expect([tester accessibilityElementExists:@"Double Elvis, 1963/1976"]).to.equal(YES);
    });
    
    
    it(@"SearchAuthor", ^{
        
//        //        navigates to home page
//        [tester tapViewWithAccessibilityLabel:@"HomeButton"];
//        if ([tester accessibilityElementExists:@"EXPLORE"]) {
//        }
//        else
//            expect([tester accessibilityElementExists:@"CURRENT SHOWS"]).to.equal(YES);
//        
//        //        navigates to search page
//        [tester tapViewWithAccessibilityLabel:@"SearchButton"];
//        expect([tester accessibilityElementExists:@"CLOSE"]).to.equal(YES);
        
        
        //        clears text field if needed
        if ([tester accessibilityElementExists:@"TextfieldClearButton"]) {
            [tester tapViewWithAccessibilityLabel:@"TextfieldClearButton"];
        }
        
        //        test
        [tester enterText:@"Kasimir Malevich" intoViewWithAccessibilityLabel:@"SearchField"];
        [tester tapViewWithAccessibilityLabel:@"Kasimir Severinovich Malevich"];
        expect([tester accessibilityElementExists:@"KASIMIR SEVERINOVICH MALEVICH"]).to.equal(YES);
        expect([tester accessibilityElementExists:@"Russian, 1879-1935"]).to.equal(YES);
        
    });
    
});

SpecEnd