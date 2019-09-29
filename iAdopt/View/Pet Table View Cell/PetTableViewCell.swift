//
//  PetTableViewCell.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-28.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {

	@IBOutlet weak var petImageView: UIImageView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var breedLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!

	var petDetails: Pet!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func setUpCell() {
		activityIndicator.startAnimating()

		GetYourPetClient.shared.downloadImage(fromUrl: URL(string: petDetails.primaryPhoto)!) { [weak self] (image, url, error) in
			guard let weakSelf = self else { return }

			guard let image = image, error == nil else {
				weakSelf.petImageView.image = UIImage()
				return
			}

			weakSelf.petImageView.image = image
			weakSelf.activityIndicator.stopAnimating()
		}

		petImageView.image = UIImage()
		breedLabel.text = petDetails.breedDisplay
		distanceLabel.text = petDetails.distanceDisplay
		nameLabel.text = petDetails.name
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
