//
//  AppDelegate.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-24.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		return true
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		try? DataController.shared.save()
	}

	func applicationWillTerminate(_ application: UIApplication) {
		try? DataController.shared.save()
	}

}

