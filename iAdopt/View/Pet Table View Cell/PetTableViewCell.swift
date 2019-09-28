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


	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
