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

    let ApplicationPreferenceKey = "Application"
    let UseTabsPreferenceKey     = "PreferTabs"

    let ApplicationForButtonTag = [ 0: "Terminal", 1: "iTerm2", 2: "xterm" ]
    let ButtonTagForApplication = [ "Terminal": 0, "iTerm2": 1, "xterm": 2 ]

    let defaults = NSUserDefaults(suiteName: "Y629ETSHLM.com.pharynks.terminalvelocity")!
    let instructPath = NSBundle.mainBundle().pathForResource("Installation", ofType: "html")!
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

        let workspace = NSWorkspace.sharedWorkspace()

        workspace.openFile(instructPath)

        let when = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * NSEC_PER_SEC))
        dispatch_after(when, dispatch_get_main_queue()) {

            workspace.selectFile(launcherPath, inFileViewerRootedAtPath: resourcePath)

        }

    }

    @IBAction func preference(sender: NSMatrix) {

        if sender != radio {
            return
        }

        let tag = (radio.selectedCell() as! NSButtonCell).tag

        defaults.setObject(ApplicationForButtonTag[tag]! as NSString, forKey: ApplicationPreferenceKey)
        defaults.synchronize()

        useTabs.enabled = (ApplicationForButtonTag[tag] != "xterm")

    }

    @IBAction func preferTabs(sender: NSButton) {

        if sender != useTabs {
            return
        }

        defaults.setBool(Bool(useTabs.state), forKey: UseTabsPreferenceKey)
        defaults.synchronize()

    }

}
