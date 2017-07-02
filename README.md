# NSUserNotificationPrivate in Swift 3

Simply open `NSUserNotificationPrivate.xcodeproj` and run.

Have a look around `AppDelegate.swift` to see what properties are being used on the NSUserNotification class

In the `NSUserNotificationPrivate-Bridging-Header.h` (Foundation.framework class-dump header file) file, you will find other properties that can be used on the NSUserNotification class:

```objective-c
@property(copy) NSImage *_identityImage;
@property BOOL _clearable;
@property unsigned long long _badgeCount;
```

To set `_identityImage`, or any other private property, call the instance method `setValue`:

```swift
notification.setValue(NSImage(named: "img"), forKey: "_identityImage")
notification.setValue(true, forKey: "_clearable")
notification.setValue(5, forKey: "_badgeCount")
```

The following properties are used to present a notification as shown in the image below:

`_identityImage`
`_identityImageHasBorder`
`_ignoresDoNotDisturb`
`_lockscreenOnly`
`_poofsOnCancel`
`_alternateActionButtonTitles`
`_alwaysShowAlternateActionMenu`
`_clearable`

<div style="text-align:center">
	<img src ="https://i.imgur.com/jaqS4YO.png" alt="notification">
</div>

### Note

In order for a notification to be able to have action buttons (buttons on the right hand side), the following key value pair must be added to `Info.plist`:

Key: `NSUserNotificationAlertStyle` Value: `alert`