//  Created by Andrew Fernandes on 2015/08/02.
//  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

import Cocoa

class ViewController: NSViewController {

    override var representedObject: AnyObject? {
        didSet {
            // this space is intentionally left blank
        }
    }

    let defaults = NSUserDefaults(suiteName: "group.Y629ETSHLM.com.pharynks.terminalvelocity")
    let launcherPath = NSBundle.mainBundle().pathForResource("Terminal Velocity Launcher", ofType: "app")

    override func viewDidLoad() {
        super.viewDidLoad()

        println("\(view.window)")

        // self.view.window!.center()
        // self.view.window!.level = Int(CGWindowLevelForKey(CGWindowLevelKey.StatusWindowLevelKey))
        // self.view.window!.makeKeyAndOrderFront(nil)

        //CGFloat xPos = NSWidth([[window screen] frame])/2 - NSWidth([window frame])/2;
        //CGFloat yPos = NSHeight([[window screen] frame])/2 - NSHeight([window frame])/2;
        //[window setFrame:NSMakeRect(xPos, yPos, NSWidth([window frame]), NSHeight([window frame])) display:YES];

        // Start here...

    }


}
