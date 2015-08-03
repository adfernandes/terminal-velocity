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
    @IBOutlet weak var useTabs: NSButton!

    let ApplicationForButtonTag = [ 0: "Terminal", 1: "iTerm2", 2: "xterm" ]
    let ButtonTagForApplication = [ "Terminal": 0, "iTerm2": 1, "xterm": 2 ]

    let ApplicationPreferenceKey = "Application"
    let UseTabsPreferenceKey     = "PreferTabs"

    let defaults = NSUserDefaults(suiteName: "Y629ETSHLM.com.pharynks.terminalvelocity")!
    let launcherPath = NSBundle.mainBundle().pathForResource("Terminal Velocity Launcher", ofType: "app")!
    let resourcePath = NSBundle.mainBundle().resourcePath!

    override func viewDidLoad() {
        super.viewDidLoad()

        defaults.synchronize()

        let prefs = defaults.dictionaryRepresentation() as! [String:AnyObject]

        if prefs[ApplicationPreferenceKey] == nil {
            defaults.setObject(ApplicationForButtonTag[0]! as NSString, forKey: ApplicationPreferenceKey)
        }

        if prefs[UseTabsPreferenceKey] == nil {
            defaults.setBool(true, forKey: UseTabsPreferenceKey)
        }

        defaults.synchronize()

        var application = defaults.stringForKey(ApplicationPreferenceKey)

        if (application == nil || ButtonTagForApplication[application!] == nil) {
            application = ApplicationForButtonTag[0]
            defaults.setObject(application! as NSString, forKey: ApplicationPreferenceKey)
        }

        defaults.synchronize()

        let tag = ButtonTagForApplication[application!]!
        let tab = defaults.boolForKey(UseTabsPreferenceKey)

        radio.selectCellWithTag(tag)
        useTabs.state = Int(tab)

        useTabs.enabled = (ApplicationForButtonTag[tag] != "xterm")

    }

    @IBAction func install(sender: NSButton) {

        println("install") // TODO

    }

    @IBAction func preference(sender: NSMatrix) {

        if sender != radio {
            return
        }

        let tag = (radio.selectedCell() as! NSButtonCell).tag

        defaults.setObject(ApplicationForButtonTag[tag]! as NSString, forKey: ApplicationPreferenceKey)
        defaults.synchronize()

        useTabs.enabled = (ApplicationForButtonTag[tag] != "xterm")

        println("preference: \(tag)")

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

    @IBAction func preferTabs(sender: NSButton) {

        if sender != useTabs {
            return
        }

        defaults.setBool(Bool(useTabs.state), forKey: UseTabsPreferenceKey)
        defaults.synchronize()

        println("useTabs: \(useTabs.state)") // TODO


    }

}
