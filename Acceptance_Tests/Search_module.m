//
//  Search_module.m
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.
//

#import "Search_module.h"

@implementation Search_module

static NSString *searchTextField = @"SearchField";

-(void)viewDidLoad {
    
}

-(void)searchByQuery:(NSString *)searchQuery {
    
    _searchQuery = [[NSString alloc] initWithString:searchQuery];
    [tester clearTextFromAndThenEnterText:_searchQuery intoViewWithAccessibilityLabel:searchTextField];
    
}

+(NSMutableArray *)getListOfSearchResults {
    
    NSInteger number = 0;
    NSMutableArray *_listOfSearchResults = [[NSMutableArray alloc] init];
    for (number = 0; number <8; number++) {
        NSIndexPath *cell_index = [NSIndexPath indexPathForRow:number inSection:0];
        UITableViewCell *cell = (UITableViewCell*)[tester waitForCellAtIndexPath:cell_index inTableViewWithAccessibilityIdentifier:@"SearchResultsTableView"];
        NSString *searchResults = cell.textLabel.text;
        [_listOfSearchResults addObject:searchResults];
    }
    return _listOfSearchResults;
}

-(void)openCorrectSearchResult:(NSString *)searchQuery {
    
}

@end
