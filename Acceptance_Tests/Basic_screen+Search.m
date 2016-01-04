#import "Basic_screen.h"

@implementation Basic_screen (Search)

static NSString *searchTextField = @"SearchField";
NSMutableArray *_listOfSearchResults;
NSString *_searchQuery;
NSString *_artist;
NSString *_artwork;
UITableView *_tableView;

-(void)searchResultsDidLoad {
    [tester waitForViewWithAccessibilityLabel:@"SearchResultsTableView"];
}

-(void)searchByQuery:(NSString *)searchQuery {
    
    _searchQuery = [[NSString alloc] initWithString:searchQuery];
    [tester clearTextFromAndThenEnterText:_searchQuery intoViewWithAccessibilityLabel:searchTextField];
}

-(NSMutableArray *)getListOfSearchResults {
    
    _tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"SearchResultsTableView"];
    NSInteger count = [_tableView numberOfRowsInSection:0];
    _listOfSearchResults = [[NSMutableArray alloc] init];
    for (NSInteger number = 0; number < count; number++) {
        NSIndexPath *cell_index = [NSIndexPath indexPathForRow:number inSection:0];
        UITableViewCell *cell = (UITableViewCell*)[tester waitForCellAtIndexPath:cell_index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
        NSString *searchResults = cell.textLabel.text;
        [_listOfSearchResults addObject:searchResults];
    }
    return _listOfSearchResults;
}

-(void)openArtistSearchResult:(NSString *)searchQuery {
    
    NSString* query = searchQuery;
    
    NSString* first = [query componentsSeparatedByString: @" "][0];
    NSString* second = [query componentsSeparatedByString:@" "][1];
    
    NSMutableArray *results = [[Basic_screen alloc] getListOfSearchResults];
    NSInteger i = [results count];
    for (NSInteger number = 0; number < i; number++) {
        NSString *result = [results objectAtIndex:number];
        if ([result containsString: first] && [result containsString:second]) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:number inSection:0];
            [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
            break;
        }
    }
}

-(void)openArtworkSearchResult:(NSString *)searchQuery {
    
    NSMutableArray *results = [[Basic_screen alloc] getListOfSearchResults];
    NSInteger i = [results count];
    for (NSInteger number = 0; number < i; number++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:number inSection:0];
        UITableViewCell *cell = (UITableViewCell*)[tester waitForCellAtIndexPath:index   inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
        if ([cell.textLabel.text hasPrefix:searchQuery]) {
            [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
            break;
        }
    }
}

@end

