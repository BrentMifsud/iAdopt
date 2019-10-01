//
//  PetCollectionViewCell.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {

	// MARK: - IBOutlets

	@IBOutlet weak var petImageView: UIImageView!

	var petImage: UIImage!

	override func awakeFromNib() {
        super.awakeFromNib()

		petImageView.image = petImage
    }

}
