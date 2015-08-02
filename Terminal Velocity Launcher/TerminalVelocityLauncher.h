#import <Foundation/Foundation.h>

@class TerminalVelocityLauncher;

@interface TerminalVelocityLauncher : NSObject

-(NSArray *)getFinderSelections; // NSArray<NSString *> *

-(void)launchTerminalFor:(NSArray *)directories; // NSArray<NSString *> *
-(void)launchITermFor:(NSArray *)directories;    // NSArray<NSString *> *

@end