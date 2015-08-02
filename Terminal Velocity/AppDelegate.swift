//  Created by Andrew Fernandes on 2015/08/02.
//  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let window: NSWindow = NSApplication.sharedApplication().windows.first! as! NSWindow

        window.center()
        window.level = Int(CGWindowLevelForKey(Int32(kCGNormalWindowLevelKey)))
        window.makeKeyAndOrderFront(nil)

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // this space is intentionally left blank
    }

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }

}
