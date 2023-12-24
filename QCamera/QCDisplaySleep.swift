//
//  QCDisplaySleep.swift
//  Quick Camera
//
//  Created by Harald Striepe on 12/23/23.
//  Copyright © 2023 Simon Guest. All rights reserved.
//

import Foundation
import IOKit
import IOKit.pwr_mgt

class DisplaySleepManager {

    var assertionID: IOPMAssertionID = 0

    func preventDisplaySleep() {
        let reasonForActivity = "Prevent Display Sleep"

        let assertionType = IOPMAssertionCreateWithName(
            kIOPMAssertPreventUserIdleDisplaySleep as CFString,
            IOPMAssertionLevel(kIOPMAssertionLevelOn),
            reasonForActivity as CFString,
            &assertionID
        )

        if assertionType == kIOReturnSuccess {
            print("Display sleep prevented.")
        } else {
            print("Failed to prevent display sleep.")
        }
    }

    func allowDisplaySleep() {
        if assertionID != 0 {
            IOPMAssertionRelease(assertionID)
            print("Display sleep allowed.")
            
        }
    }
}

// Example usage:

//let displaySleepManager = DisplaySleepManager()

// Call this function when you want to prevent display sleep
// displaySleepManager.preventDisplaySleep()

// Call this function when you want to allow display sleep
// displaySleepManager.allowDisplaySleep()
