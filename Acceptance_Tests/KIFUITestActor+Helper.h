//  KIFUITestActor+Helper.h
//  Pods
//
//  Created by Kondel Iryna on 10/9/15.

#import <KIF/KIF.h>
#import "KIFUITestActor.h"

@interface KIFUITestActor (Helper)

- (BOOL)accessibilityElementExists:(NSString *)label;

@end
