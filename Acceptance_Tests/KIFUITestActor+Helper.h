#import <KIF/KIF.h>

@interface KIFUITestActor (Helper)

- (BOOL)existsViewWithAccessibilityLabel:(NSString *)label;

@end
