//  Created by Andrew Fernandes on 2015/08/01.
//  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

#import "TerminalVelocityLauncher.h"

#import <string.h>
#import <stdlib.h>
#import <libgen.h>

#import <sys/stat.h>

#import <vector>
#import <string>
#import <algorithm>

using namespace std;

int main(int argc, const char * argv[]) {

    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName: @"Y629ETSHLM.com.pharynks.terminalvelocity"];

    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];

    Class TerminalVelocityLauncherClass = NSClassFromString(@"TerminalVelocityLauncher");

    TerminalVelocityLauncher *script = [[TerminalVelocityLauncherClass alloc] init];
    NSArray *selections = [script getFinderSelections];

    if ([selections count] < 1) {
        selections = @[NSHomeDirectory()];
    }

    // Resolve the filenames and paths retrieved from the Finder selection.

    vector<string> resolved_names;
    for(NSString *selection in selections) {
        char * resolved_name = realpath([selection UTF8String], nullptr);
        if (resolved_name != nullptr) {
            resolved_names.push_back(string(resolved_name));
            free(resolved_name);
        }
    }

    // Keep only the directories, or the parent directory of non-directory filenames.

    vector<string> directories;
    for (auto resolved_name : resolved_names) {

        struct stat info;

        const int failed = stat(resolved_name.c_str(), &info);
        if (failed) continue;

        if ( (info.st_mode & S_IFMT) == S_IFDIR ) {

            directories.push_back(resolved_name);

        } else {

            char path[PATH_MAX+1];
            strncpy(path, resolved_name.c_str(), PATH_MAX);

            char * dir_name = dirname(path);
            if (dir_name == nullptr) continue;

            const int failed = stat(dir_name, &info);
            if (failed) continue;

            if ( (info.st_mode & S_IFMT) == S_IFDIR ) {
                directories.push_back(dir_name);
            } else {
                continue;
            }

        }

    }

    // Sort and make the list unique.

    sort(directories.begin(), directories.end());
    auto directories_end = unique(directories.begin(), directories.end());
    directories.resize(distance(directories.begin(), directories_end));

    // And open a terminal at each location.

    NSMutableArray *paths = [[NSMutableArray alloc] init];
    for (auto directory : directories) {
        [paths addObject:[NSString stringWithUTF8String: directory.c_str()]];
    }

    [script launchTerminalWindowsFor: paths];
    [script launchITermWindowsFor: paths];
    
    // Done.
    
    return 0;
}
