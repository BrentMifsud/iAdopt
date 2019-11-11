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

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		DataController.shared.load()

		if #available(iOS 13.0, *) {
			return true
		} else {
			self.window = UIWindow(frame: UIScreen.main.bounds)

			let storyboard = UIStoryboard.init(name: "Main", bundle: nil)

			let viewController = storyboard.instantiateViewController(withIdentifier: "homePageViewController")

			self.window?.rootViewController = viewController
			self.window?.makeKeyAndVisible()
		}

		return true
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		try? DataController.shared.save()
	}

	func applicationWillTerminate(_ application: UIApplication) {
		try? DataController.shared.save()
	}

}

