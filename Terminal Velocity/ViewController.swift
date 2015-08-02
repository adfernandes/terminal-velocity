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

        // Start here...

    }


}
