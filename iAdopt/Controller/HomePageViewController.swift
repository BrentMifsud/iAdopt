//
//  HomePageViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-24.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

	// MARK: - Class Properties
	private var skipViewController: Bool {
		return UserDefaults.standard.bool(forKey: UserDefaultKeys.skipHome)
	}

	// MARK: - View Lifecycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		// If the user has already seen this page, we dont want to see it again.
		if skipViewController {
			performSegue(withIdentifier: "showSearchView", sender: self)
		}
	}

	// MARK: - IBActions
	@IBAction func beginButtonPressed(_ sender: Any) {
		UserDefaults.standard.set(true, forKey: UserDefaultKeys.skipHome)
		performSegue(withIdentifier: "showSearchView", sender: self)
	}
}

