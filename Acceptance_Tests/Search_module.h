//
//  Search_module.h
//  Artsy
//
//  Created by Iryna Krasylnykova on 12/17/15.
//  Copyright © 2015 Artsy. All rights reserved.
//

#import <KIF/KIF.h>

@interface Search_module : KIFUITestActor {
    
    NSMutableArray *_listOfSearchResults;
    NSString *_searchQuery;
}

-(void)viewDidLoad;
-(void)searchByQuery:(NSString *)searchQuery;
+(NSMutableArray *)getListOfSearchResults;
-(void)openCorrectSearchResult:(NSString *)searchQuery;

@end
