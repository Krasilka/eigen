#import <KIF/KIF.h>
#import "KIFUITestActor.h"

@interface Basic_screen : KIFUITestActor

-(void)openSearch;
-(void)goBackToPreviousScreen;
-(void)dismissAlert;

@end

@interface Basic_screen (Navigation)

-(void)navigateToHomePage;

@end

@interface Basic_screen (Search)

-(void)searchByQuery:(NSString *)searchQuery;
-(void)searchResultsDidLoad;
-(id)getListOfSearchResults;
-(void)openArtistSearchResult:(NSString *)searchResult;
-(void)openArtworkSearchResult:(NSString *)searchResult;

@end