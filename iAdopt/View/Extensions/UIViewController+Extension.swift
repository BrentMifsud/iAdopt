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

	func subscribeToKeyboardNotifications() {
		self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnTap)))
	}

	func unsubscribeFromKeyboardNotifications() {
		self.view.removeGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnTap)))
	}

	@objc func dismissKeyboardOnTap(){
		self.view.endEditing(true)
	}

	func showActivityIndicator(activityView: inout UIView, _ enabled: Bool){
		if enabled {
			// Set up Activity View
			activityView = UIView(frame: view.frame)
			activityView.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview(activityView)
			activityView.backgroundColor = UIColor(white: 0, alpha: 0.5)

			// Set up Activity Indicator
			let activityIndicator = UIActivityIndicatorView(style: .large)
			activityIndicator.translatesAutoresizingMaskIntoConstraints = false
			activityView.addSubview(activityIndicator)
			activityIndicator.center = activityView.center
			activityIndicator.startAnimating()

			// Set up constraints
			NSLayoutConstraint.activate([
				activityView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
				activityView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
				activityView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
				activityView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
				activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
				activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
			])
		} else {
			activityView.removeFromSuperview()
		}
	}
}
