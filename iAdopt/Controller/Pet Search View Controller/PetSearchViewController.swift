//
//  PetSearchViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-25.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class PetSearchViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet weak var speciesSelector: UISegmentedControl!
	@IBOutlet weak var zipCodeTextField: UITextField!
	@IBOutlet weak var distanceSlider: UISlider!
	@IBOutlet weak var distanceLabel: UILabel!

	// MARK: - Class Properties
	private var selectionString = SelectorValue.cat

	// MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - IBActions
	@IBAction func distanceSliderDidChangeValue(_ sender: UISlider) {
		let intValue = Int(sender.value)
		let stringValue = String(intValue)
		distanceLabel.text = stringValue
	}

	@IBAction func speciesSelectorDidChange(_ sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			selectionString = SelectorValue.cat
		} else {
			selectionString = SelectorValue.dog
		}
	}


	@IBAction func beginSearchPressed(_ sender: UIButton) {
	}

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
