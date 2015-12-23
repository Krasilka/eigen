
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "Specta/Specta.h"
#import <Expecta/Expecta.h>
#import "Welcome_screen.h"
#import "Basic_screen.h"
#import "Search_module.h"
#import "Navigation_module.h"
#import "Artist_screen.h"
#import "Artwork_screen.h"

static NSString *artworkSearchQuery = @"Double Elvis";
static NSString *artistSearchQuery = @"Kasimir Malevich";
static NSString *artistOfArtwork = @"Andy Warhol";
static NSString *artistName = @"Kasimir Severinovich Malevich";
static NSString *artistInfo = @"Russian, 1879-1935";

SpecBegin (Search)

describe(@"Search", ^{
    
        beforeAll( ^{
            [[Welcome_screen new] tryWithoutAccount];
//            [[Home_screen new] viewDidLoad];
        });
    
        beforeEach( ^{
            [[Basic_screen new] openSearch];
        });
    
    context(@"for artwork", ^{
    it(@"returns correct artist's name on artwork sreen", ^{
        
        [[Search_module new] searchByQuery:artworkSearchQuery];
        
        [tester waitForTimeInterval:5];
        //should be viewDidLoad method here

        [[Search_module new] getListOfSearchResults];
        [[Search_module new] openArtworkSearchResult:artistOfArtwork];
        
        [tester waitForTimeInterval:5];
        
        expect([[Artwork_screen new] getArtistOfArtwork]).to.equal(artistOfArtwork.uppercaseString);
    
    });
    });
    
    context(@"for artist", ^{
    it(@"returns correct artist's name, nationality and years on artist screen", ^{

        [[Search_module new] searchByQuery:artistSearchQuery];
        [[Search_module new] openArtistSearchResult:artistSearchQuery];
        
        [tester waitForTimeInterval:5];
        
        expect([[Artist_screen new] getArtistName]).to.equal(artistName.uppercaseString);
        expect([[Artist_screen new] getArtistInfo]).to.equal(artistInfo);
    });
    });

        afterEach( ^{
            Navigation_module *navigate = [[Navigation_module alloc] init];
            [navigate toHomePage];
        });
});


SpecEnd
