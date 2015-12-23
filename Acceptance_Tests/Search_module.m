//  Search_module.m
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.

#import "Search_module.h"

@implementation Search_module

static NSString *searchTextField = @"SearchField";

-(void)viewDidLoad {
    
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

-(void)openArtistSearchResult:(NSString *)searchResult {

//    NSIndexPath *first = [NSIndexPath indexPathForRow:0 inSection:0];
//            [tester tapRowAtIndexPath:first inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
    
    NSString *new = searchResult;
    NSString* nameString = [new componentsSeparatedByString: @" "][0];
    NSString* surnameString = [new componentsSeparatedByString:@" "][1];

    NSMutableArray *results = [[Search_module alloc] getListOfSearchResults];
    NSInteger i = [results count];
    for (NSInteger number = 0; number < i; number++) {
        NSString *result = [results objectAtIndex:number];
        if ([result containsString :nameString] && [result containsString:surnameString]) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:number inSection:0];
            [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
            break;
        }
    }
}

-(void)openArtworkSearchResult:(NSString *)searchResult {
    
    NSMutableArray *results = [[Search_module alloc] getListOfSearchResults];
    NSInteger i = [results count];
    for (NSInteger number = 0; number < i; number++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:number inSection:0];
        UITableViewCell *cell = (UITableViewCell*)[tester waitForCellAtIndexPath:index   inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
        
        if ([cell.textLabel.text hasPrefix:searchResult]) {
            [tester tapRowAtIndexPath:index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
            break;
        }
    }
}

@end
