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

    enum RadioButtonTag : Int {
        case Terminal = 0
        case iTerm = 1
        case xterm = 2
    }

    let defaults = NSUserDefaults(suiteName: "group.Y629ETSHLM.com.pharynks.terminalvelocity")
    let launcherPath = NSBundle.mainBundle().pathForResource("Terminal Velocity Launcher", ofType: "app")

    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonCell = radio.selectedCell() as! NSButtonCell
        let tag = RadioButtonTag(rawValue: buttonCell.tag)

        // TODO: If there is no default, save the current tag as the default.

    }

    @IBAction func install(sender: NSButton) {

        println("install") // TODO

    }

    @IBAction func preference(sender: NSMatrix) {
        let buttonCell = sender.selectedCell() as! NSButtonCell
        let tag = RadioButtonTag(rawValue: buttonCell.tag)

        println("preference: \(tag)") // TODO - also, add the 'xterm' option

        // xterm -e "cd '/Applications' && pwd && bash -l"
        //
        // NSTask *task = [[NSTask alloc] init];
        // task.launchPath = @"/usr/bin/grep";
        // task.arguments = @[@"foo", @"bar.txt"];
        // [task launch];
        //
        // Or use:
        //
        // let task = NSTask.launchedTaskWithLaunchPath(_ path: String, arguments arguments: [NSString]) -> NSTask
        // task.launch()
        //
        // The strings in arguments do not undergo shell expansion, so you do not need to do special quoting, and shell variables, such as $PWD, are not resolved.
        //
        // BETTER: Use the 'currentDirectoryPath' property prior to launch, rather than using the 'cd' command! Then 'xterm -e "pwd && bash -l"'

    }

}
