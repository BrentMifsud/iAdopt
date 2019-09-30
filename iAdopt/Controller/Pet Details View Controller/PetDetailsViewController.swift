//
//  PetDetailsViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit
import MapKit

class PetDetailsViewController: UIViewController {

	// MARK: - IBOutlets

	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var petImageCollectionView: UICollectionView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var breedLabel: UILabel!
	@IBOutlet weak var adoptionDeadlineLabel: UILabel!
	@IBOutlet weak var genderLabel: UILabel!
	@IBOutlet weak var ageLabel: UILabel!
	@IBOutlet weak var sizeLabel: UILabel!
	@IBOutlet weak var activityLabel: UILabel!
	@IBOutlet weak var spayedNeuteredLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var stateLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var locationMapView: MKMapView!
	@IBOutlet weak var storyTextView: UITextView!
	@IBOutlet weak var goodWithCatsLabel: UILabel!
	@IBOutlet weak var goodWithDogsLabel: UILabel!
	@IBOutlet weak var goodWithChildrenUnder5Label: UILabel!
	@IBOutlet weak var goodWithChildren5to10Label: UILabel!
	@IBOutlet weak var goodWithChildrenOver10Label: UILabel!
	@IBOutlet weak var coatLabel: UILabel!
	@IBOutlet weak var clawsLabel: UILabel!




	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
