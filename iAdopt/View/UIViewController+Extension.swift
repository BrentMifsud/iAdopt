//
//  UIViewController+Extension.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

	/// Reusable method for presenting a standard Error Alert.
	/// - Parameter title: Title Bar Message.
	/// - Parameter message: More detailed body message.
	func presentErrorAlert(title: String, message: String){
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alertVC, animated: true, completion: nil)
	}
}
