//  Created by Andrew Fernandes on 2015/08/02.
//  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

import Cocoa

class ViewController: NSViewController {

    override var representedObject: AnyObject? {
        didSet {
            // this space is intentionally left blank
        }
    }

    @IBOutlet weak var radio: NSMatrix!

    let defaults = NSUserDefaults(suiteName: "group.Y629ETSHLM.com.pharynks.terminalvelocity")
    let launcherPath = NSBundle.mainBundle().pathForResource("Terminal Velocity Launcher", ofType: "app")

    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonCell = radio.selectedCell() as! NSButtonCell
        let tag = buttonCell.tag

        // TODO: If there is no default, save the current tag as the default.

    }

    @IBAction func install(sender: NSButton) {

        println("install") // TODO

    }

    @IBAction func preference(sender: NSMatrix) {
        let buttonCell = sender.selectedCell() as! NSButtonCell
        let tag = buttonCell.tag

        println("preference: \(tag)") // TODO

    }

}
