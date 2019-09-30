//
//  PetSearchResultsViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-29.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class PetSearchResultsViewController: UIViewController {

	// MARK: - IBOutlets

	@IBOutlet weak var getYourPetButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var getYourPetView: UIView!

	// MARK: - Class properties

	let reuseId = "petCell"

	var petType: SearchResults.PetTypeShown!

	var activityView: UIView!

	// MARK: - View lifecycle methods

	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: reuseId)
    }

	@IBAction func getYourPetButtonPressed(_ sender: UIButton) {
		let app = UIApplication.shared
		if let toOpen = GetYourPetClient.UrlConstants.homePageUrl {
			app.open(toOpen, options: [:], completionHandler: nil)
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
