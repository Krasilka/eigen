

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "Specta/Specta.h"
#import <Expecta/Expecta.h>
#import "KIFUITestActor+Helper.h"
#import "Welcome_screen.h"
#import "Basic_screen.h"
#import "Search_module.h"
#import "Navigation_module.h"

static NSString *artworkSearchQuery = @"Double Elvis";
static NSString *artistSearchQuery = @"Kasimir Malevich";
static NSString *artistOfArtwork = @"Andy Warhol";
static NSString *artistName = @"Kasimir Severinovich Malevich";
static NSString *artistInfo = @"Russian, 1879-1935";

SpecBegin (Search)

describe(@"Search", ^{
    
        beforeAll( ^{
            [[Welcome_screen new] tryWithoutAccount];
        });
    
        beforeEach( ^{
            [[Basic_screen new] openSearch];
        });
    
    context(@"for artwork", ^{
    it(@"returns correct artist's name on artwork sreen", ^{
        
        [[Search_module new] searchByQuery:artworkSearchQuery];
        [tester waitForTimeInterval:5];
        //should be viewDidLoad method here
       
        //creates array from search results:
        NSInteger number = 0;
        NSMutableArray *cells = [[NSMutableArray alloc] init];
        for (number = 0; number <8; number++) {
            NSIndexPath *cell_index = [NSIndexPath indexPathForRow:number inSection:0];
            UITableViewCell *cell = (UITableViewCell*)[tester waitForCellAtIndexPath:cell_index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
            NSString *searchResults = cell.textLabel.text;
            [cells addObject:searchResults];
//            if ([searchResults hasPrefix:artistOfArtwork]) {
//                [tester tapRowAtIndexPath:cell_index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
//                break;
//            }
        }
        
        NSLog(@"%@", cells);
        
       //checks if cell contains Artist name and artwork name and taps correct Search Result:
        NSInteger a = [cells count];
        NSLog(@"%li", a);
        [cells containsObject:artistOfArtwork];
        for (number = 0; number < [cells count]; number++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:number inSection:0];
        UITableViewCell *cell = (UITableViewCell*)[tester waitForCellAtIndexPath:index   inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
            NSLog(@"%@", cell.textLabel.text);
            
//            if ([cell.textLabel.text hasPrefix:artistOfArtwork]) {
//                [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
//                break;
//            }
        }
        
        NSIndexPath *index = [NSIndexPath indexPathForRow:1 inSection:0 ];
        [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
        [tester waitForTimeInterval:5];
        
        //expects to see correct artist name on Artwork detail page
        
//        NSArray *filteredSearchResults = [cells filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES %@", searchResultRegex]];
//        
//        if (filteredSearchResults.count > 0) {
//            NSLog(@"%@", filteredSearchResults);
//        }
        
//        NSArray *filteredSearchResults = [cells filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS  artistOfArtwork, artworkSearchQuery]];
//        
////        if ([cells containsObject:@"Andy Warhol, Double Elvis"]) {
////            number = [cells indexOfObject:@"Andy Warhol, Double Elvis"];
////            NSIndexPath *index = [NSIndexPath indexPathForRow:number inSection:0];
////            [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
////        }
//        if (filteredSearchResults.count > 0) {
//                        NSLog(@"%@", filteredSearchResults);
//                    }
//        else
//        { NSLog(@"No search results! Smth went wrong!");
//        }
//        
//        NSLog(@"%@, %@", artistOfArtwork, artworkSearchQuery);
    
        
        UIView *view = [tester waitForViewWithAccessibilityLabel:@"Artist Of Artwork" traits:UIAccessibilityTraitStaticText];
  
        [view isKindOfClass:[UILabel class]];
        NSString *artistLink = ((UILabel *)view).text;
    
        NSLog(@"%@", artistLink);

        expect(artistLink).to.equal(artistOfArtwork.uppercaseString);
    
    });
    });
    
    context(@"for artist", ^{
    it(@"returns correct artist's name, nationality and years on artist screen", ^{

        [[Search_module new] searchByQuery:artistSearchQuery];

        NSIndexPath *first = [NSIndexPath indexPathForRow:0 inSection:0];
        [tester tapRowAtIndexPath:first inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
        [tester waitForTimeInterval:7];

//        @"I see correct artist's data on Artist details screen", ^{
        
        UIView *artist_name_view = [tester waitForViewWithAccessibilityLabel:@"Artist Full Name" traits:UIAccessibilityTraitStaticText];

        [artist_name_view isKindOfClass:[UILabel class]];
        NSLog(@"OMG %@", ((UILabel *)artist_name_view).text);
        NSString *artist_name_text_view = ((UILabel *)artist_name_view).text;
        
        expect(artist_name_text_view).to.equal(artistName.uppercaseString);
        
        
        UIView *artist_info_view = [tester waitForViewWithAccessibilityLabel:@"Artist Info" traits:UIAccessibilityTraitStaticText];
        
        [artist_info_view isKindOfClass:[UILabel class]];
        NSLog(@"OMG %@", ((UILabel *)artist_info_view).text);
        NSString *artist_info_text_view = ((UILabel *)artist_info_view).text;
        
        expect(artist_info_text_view).to.equal(artistInfo);
    });
    });

        afterEach( ^{
            Navigation_module *navigate = [[Navigation_module alloc] init];
            [navigate toHomePage];
        });
});


SpecEnd
