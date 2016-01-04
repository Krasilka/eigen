
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "Specta/Specta.h"
#import <Expecta/Expecta.h>
#import "Welcome_screen.h"
#import "Basic_screen.h"
#import "Artist_screen.h"
#import "Artwork_screen.h"

static NSString *artworkSearchQuery = @"Double Elvis";
static NSString *artistSearchQuery = @"Kasimir Malevich";
static NSString *artistOfArtwork = @"Andy Warhol";
static NSString *artistName = @"Kasimir Severinovich Malevich";
static NSString *artistInfo = @"Russian, 1879-1935";

SpecBegin (Search)

describe(@"Search", ^{
    
    __block Basic_screen *user;
    __block Welcome_screen *choose;
    __block Artwork_screen *artworkResult;
    __block Artist_screen *artistResult;
    
    beforeAll( ^{
        user = [[Basic_screen alloc] init];
        choose = [[Welcome_screen alloc] init];
        [choose tryWithoutAccount];
        [user dismissAlert];
    });
    
    beforeEach( ^{
        [user openSearch];
    });
    
    context(@"for artwork", ^{
        before(^{
            artworkResult = [[Artwork_screen alloc] init];
            [user searchByQuery:artworkSearchQuery];
            [user getListOfSearchResults];
            [user openArtworkSearchResult:artistOfArtwork];
        });
        
    it(@"returns correct artist's name on artwork sreen", ^{
        NSString* result = [artworkResult getArtistOfArtwork];
        
        expect(result.uppercaseString).to.equal(artistOfArtwork.uppercaseString);
    });
    });
    
    context(@"for artist", ^{
        before(^{
            artistResult = [[Artist_screen alloc] init];
            [user searchByQuery:artistSearchQuery];
            [user openArtistSearchResult:artistSearchQuery];
        });
        
    it(@"returns correct artist's name, nationality and years on artist screen", ^{
        NSString* artist = [artistResult getArtistName];
        NSString* info = [artistResult getArtistInfo];
        
        expect(artist.uppercaseString).to.equal(artistName.uppercaseString);
        expect(info.uppercaseString).to.equal(artistInfo.uppercaseString);
    });
    });

    afterEach( ^{
        [user navigateToHomePage];
    });
});

SpecEnd
