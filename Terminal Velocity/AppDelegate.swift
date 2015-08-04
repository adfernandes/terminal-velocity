//  Created by Andrew Fernandes on 2015/08/02.
//  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

import Cocoa
import Sparkle

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let updater = SUUpdater.sharedUpdater()
        let window = NSApplication.sharedApplication().windows.first! as! NSWindow
        let arguments = NSProcessInfo.processInfo().arguments as! [String]

        println("lastUpdateCheckDate: \(updater.lastUpdateCheckDate)")

        window.center()
        window.level = Int(CGWindowLevelForKey(Int32(kCGNormalWindowLevelKey))) // or kCGStatusWindowLevelKey, but this hides the 'about' dialog
        window.makeKeyAndOrderFront(nil)
        // TODO // window.orderOut(nil)

    }

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // this space is intentionally left blank
    }

}
