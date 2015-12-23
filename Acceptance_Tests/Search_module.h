//  Search_module.h
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.

#import <KIF/KIF.h>

@interface Search_module : KIFUITestActor {
    
    NSMutableArray *_listOfSearchResults;
    NSString *_searchQuery;
    NSString *_artist;
    NSString *_artwork;
    UITableView *_tableView;
}

-(void)viewDidLoad;
-(void)searchByQuery:(NSString *)searchQuery;
-(id)getListOfSearchResults;
-(void)openArtistSearchResult:(NSString *)searchResult;
-(void)openArtworkSearchResult:(NSString *)searchResult;

@end
