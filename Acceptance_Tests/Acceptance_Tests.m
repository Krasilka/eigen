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
    
    beforeAll( ^{
                  if ([tester accessibilityElementExists:@"SIGN UP"]) {
                      [tester tapViewWithAccessibilityLabel:@"TRY WITHOUT AN ACCOUNT"];
                  };
    
    });
    
    beforeEach( ^{
         [tester waitForViewWithAccessibilityLabel:@"HomeButton"];
                         if ([tester accessibilityElementExists:@"EXPLORE"]) {
                             expect([tester accessibilityElementExists:@"EXPLORE"]).to.equal(YES);
                         };
                        if ([tester accessibilityElementExists:@"CURRENT SHOWS"]) {
                            expect([tester accessibilityElementExists:@"CURRENT SHOWS"]).to.equal(YES);
                        };
        
         [tester waitForViewWithAccessibilityLabel:@"SearchButton"];
         [tester tapViewWithAccessibilityLabel:@"SearchButton"];
         expect([tester accessibilityElementExists:@"CLOSE"]).to.equal(YES);
         if ([tester accessibilityElementExists:@"TextfieldClearButton"]) {
             [tester tapViewWithAccessibilityLabel:@"TextfieldClearButton"];
         };
         
    });
    
    
    it(@"SearchArtwork", ^{
        
        [tester enterText:@"Double Elvis" intoViewWithAccessibilityLabel:@"SearchField"];
        [tester tapViewWithAccessibilityLabel:@"Andy Warhol, Double Elvis (1963/1976)"];
        expect([tester accessibilityElementExists:@"ANDY WARHOL"]).to.equal(YES);
        expect([tester accessibilityElementExists:@"Double Elvis, 1963/1976"]).to.equal(YES);
    });
    
    
    it(@"SearchAuthor", ^{
        
        [tester enterText:@"Kasimir Malevich" intoViewWithAccessibilityLabel:@"SearchField"];
        [tester tapViewWithAccessibilityLabel:@"Kasimir Severinovich Malevich"];
        expect([tester accessibilityElementExists:@"KASIMIR SEVERINOVICH MALEVICH"]).to.equal(YES);
        expect([tester accessibilityElementExists:@"Russian, 1879-1935"]).to.equal(YES);
        
    });
    
    afterEach( ^{
        [tester tapViewWithAccessibilityLabel:@"HomeButton"];
    });


});

SpecEnd