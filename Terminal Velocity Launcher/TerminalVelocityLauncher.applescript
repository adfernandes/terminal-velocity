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

    on launchTerminalFor:(directories)

        tell application "Terminal"

            activate

            repeat with directory in directories

                set theDirectory to (the directory as string)

                do script "cd " & (the quoted form of theDirectory) & "; clear; pwd"

            end repeat

        end tell

    end launchTerminalFor

    -- handler

    on launchITermFor:(directories)

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

    --

end script