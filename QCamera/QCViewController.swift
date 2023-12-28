//
//  QCViewController.swift
//  Quick Camera
//
//  Created by Harald Striepe on 12/26/23.
//  Copyright © 2023 Simon Guest. All rights reserved.
//  Hide & unhide cursor under all cirumcstances

import Cocoa

class QCView: NSView {

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()

        guard let window = self.window else { return }

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willEnterFullScreen),
                                               name: NSWindow.willEnterFullScreenNotification,
                                               object: window)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willExitFullScreen),
                                               name: NSWindow.willExitFullScreenNotification,
                                               object: window)
    }

    @objc func willEnterFullScreen(notification: Notification) {
        NSLog("Enter full screen via QCView Class and hide cursor.");
        NSCursor.hide();
    }

    @objc func willExitFullScreen(notification: Notification) {
        NSLog("Exit full screen via QCView Class and unhide cursor");
        NSCursor.unhide();
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
