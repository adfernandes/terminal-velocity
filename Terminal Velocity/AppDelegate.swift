//  Created by Andrew Fernandes on 2015/08/02.
//  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

import Cocoa
import Sparkle

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, SUUpdaterDelegate {

    var updater: SUUpdater!
    var arguments: [String]!

    func applicationWillFinishLaunching(notification: NSNotification) {

        arguments = NSProcessInfo.processInfo().arguments 
        print("arguments: \(arguments)")

        updater = SUUpdater.sharedUpdater()
        print("lastUpdateCheckDate: \(updater.lastUpdateCheckDate)")
        updater.delegate = self

    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let window = NSApplication.sharedApplication().windows.last! 

        window.center()
        window.level = Int(CGWindowLevelForKey(.NormalWindowLevelKey)) // or .StatusWindowLevelKey, but this hides the 'about' dialog
        window.makeKeyAndOrderFront(nil)
        // TODO // window.orderOut(nil)

    }

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {

        return !( SUUpdater.sharedUpdater().updateInProgress )

    }

    func applicationWillTerminate(aNotification: NSNotification) {

        // this space is intentionally left blank

    }

}
