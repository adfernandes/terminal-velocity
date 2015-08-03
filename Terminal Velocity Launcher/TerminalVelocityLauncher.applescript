--  Created by Andrew Fernandes on 2015/08/01.
--  Copyright (c) 2015 Pharynks Corporation. All rights reserved.

use framework "Foundation"

use scripting additions

script TerminalVelocityLauncher
    property parent : class "NSObject"

    -- handler

    on getFinderSelections()

        set theArray to init() of alloc() of class "NSMutableArray" of current application

        tell application "Finder"
            if the selection is {} then
                try
                    set finderSelection to {folder of the front Finder window as alias}
                    on error
                    beep
                    return theArray
                end try
                else
                -- various bugs in Finder and AppleScript relating to 'as alias list'
                -- coercion and/or using it on 'selection' property, so get a list of
                -- Finder references and coerce them one at a time in AppleScript
                set finderSelection to selection
                repeat with itemRef in finderSelection
                    set itemRef's contents to itemRef as alias
                end repeat
            end if
        end tell

        repeat with theSelectionAlias in finderSelection
            theArray's addObject_(POSIX path of theSelectionAlias)
        end repeat

        return theArray

    end getFinderSelections

    -- handler

    on launchTerminalWindowsFor:(directories)

        tell application "Terminal"

            activate

            repeat with directory in directories

                set theDirectory to (the directory as string)

                do script "cd " & (the quoted form of theDirectory) & "; clear; pwd"

            end repeat

        end tell

    end launchTerminalFor

    -- handler

    on launchTerminalTabsFor:(directories)

        set theDelay to 0.5

        tell application "Terminal"

            activate

            if the (count of directories) > 0 then

                do script "cd " & (the quoted form of item 1 of directories) & "; clear; pwd"
                delay theDelay

                set theWindow to the front window

                repeat with i from 2 to the count of directories

                    tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
                    delay theDelay

                    do script "cd " & (the quoted form of item i of directories) & "; clear; pwd" in (tab i of theWindow)
                    delay theDelay

                end repeat

            end if

        end tell

    end launchTerminalTabsFor

    -- handler

    on launchITermWindowsFor:(directories)

        tell application "iTerm"

            activate

            repeat with directory in directories

                set theDirectory to (the directory as string)

                tell the current session of (create window with default profile)
                    write text "cd " & (the quoted form of theDirectory) & "; clear; pwd"
                end tell
                
            end repeat
            
        end tell
        
    end launchITermFor

    -- handler

    on launchITermTabsFor:(directories)

        tell application "iTerm"

            activate

            if the (count of directories) > 0 then

                set theWindow to (create window with default profile)

                tell the current session of theWindow
                    write text "cd " & (the quoted form of item 1 of directories) & "; clear; pwd"
                end tell

                repeat with i from 2 to the count of directories
                    tell theWindow
                        set theTab to (create tab with default profile)
                        tell theTab's session
                            write text "cd " & (the quoted form of item i of directories) & "; clear; pwd"
                        end tell
                    end tell
                end repeat

            end if

        end tell

    end launchITermTabsFor

    --

end script