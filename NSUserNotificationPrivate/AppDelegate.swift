//
//  AppDelegate.swift
//  PrivateNSNotification
//
//  Created by Luka Kerr on 2/7/17.
//  Copyright © 2017 Luka Kerr. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		NSUserNotificationCenter.default.delegate = self
		showNotification()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
	}
	
	func showNotification() -> Void {
		let notification: NSUserNotification = NSUserNotification()
		notification.title = "Notification Title"
		notification.subtitle = "Notification Subtitle"
		notification.informativeText = "Notification informative text..."
		notification.contentImage = NSImage(named: "contentImg")
		notification.hasActionButton = true
		notification.actionButtonTitle = "Action"
		notification.otherButtonTitle = "Clear"
		
		// Below this is private (not documented)
		notification.setValue(NSImage(named: "img"), forKey: "_identityImage")
		notification.setValue(true, forKey: "_identityImageHasBorder")
		notification.setValue(true, forKey: "_ignoresDoNotDisturb")
		notification.setValue(false, forKey: "_lockscreenOnly")
		notification.setValue(true, forKey: "_poofsOnCancel")
		notification.setValue(["Test", "Test1"], forKey: "_alternateActionButtonTitles")
		notification.setValue(true, forKey: "_alwaysShowAlternateActionMenu")
		notification.setValue(12, forKey: "_badgeCount")
		// For swiping to clear the notification
		notification.setValue(false, forKey: "_clearable")
		
		NSUserNotificationCenter.default.deliver(notification)
		
		// Note:
		// For the notification to have action buttons (hasActionButton, _alternateActionButtonTitles, _alwaysShowAlternateActionMenu)
		// You must add the key and value below to the Info.plist (in this project it is already added)
		// key: NSUserNotificationAlertStyle value: alert
	}

	// This is used to present the notification even if application is in focus
	func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
		return true
	}
	
	// This is called when the user taps on one of the _alternateActionButtonTitles buttons
	// It prints an unsigned long long, which is just the index of the button
	// i.e. if you have 2 butons, and the first is clicked, the number 0 will print
	func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
		print(notification._alternateActionIndex)
	}
	
}
