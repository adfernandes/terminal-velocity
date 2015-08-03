#import <Foundation/Foundation.h>

@class TerminalVelocityLauncher;

@interface TerminalVelocityLauncher : NSObject

-(NSArray *)getFinderSelections; // NSArray<NSString*>*

-(void)launchTerminalWindowsFor:(NSArray *)directories; // NSArray<NSString*>*
-(void)launchTerminalTabsFor:(NSArray *)directories;    // NSArray<NSString*>*

-(void)launchITerm2WindowsFor:(NSArray *)directories; // NSArray<NSString*>*
-(void)launchITerm2TabsFor:(NSArray *)directories;    // NSArray<NSString*>*

@end