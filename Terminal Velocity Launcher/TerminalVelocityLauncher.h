#import <Foundation/Foundation.h>

@class TerminalVelocityLauncher;

@interface TerminalVelocityLauncher : NSObject

-(NSArray *)getFinderSelections; // NSArray<NSString*>*

-(void)launchTerminalWindowsFor:(NSArray *)directories; // NSArray<NSString*>*
-(void)launchTerminalTabsFor:(NSArray *)directories; // NSArray<NSString*>*

-(void)launchITermWindowsFor:(NSArray *)directories; // NSArray<NSString*>*
-(void)launchITermTabsFor:(NSArray *)directories;    // NSArray<NSString*>*

@end