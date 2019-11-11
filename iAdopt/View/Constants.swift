//
//  Constants.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-25.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

enum Segues {
	static let searchView = "showSearchView"
	static let searchResults = "showPetSearchResultsView"
	static let petDetails = "showPetDetailsView"
}

enum UserDefaultKeys {
	static let skipHome = "skipHome"
}

func getPlaceholderImage() -> UIImage{
	if #available(iOS 13.0, *) {
		return UIImage(systemName: "photo")!
	} else {
		let photoPlaceholder = #imageLiteral(resourceName: "imagePlaceholder")
		return photoPlaceholder.withRenderingMode(.alwaysTemplate)
	}
}

func getHeartImage(isFavorite: Bool) -> UIImage {
	if #available(iOS 13.0, *){
		let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .medium)

		if isFavorite {
			return UIImage(systemName: "heart.fill", withConfiguration: config)!
		} else {
			return UIImage(systemName: "heart", withConfiguration: config)!
		}
	} else {
		if isFavorite {
			let heartFilled = #imageLiteral(resourceName: "heartFilled")
			return heartFilled.withRenderingMode(.alwaysTemplate)
		} else {
			let heart = #imageLiteral(resourceName: "heart")
			return heart.withRenderingMode(.alwaysTemplate)
		}
	}
}
