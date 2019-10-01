//
//  MKMapView+Extensions.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
	/// Set all map interaction on or off
	/// - Parameter enabled: Whether to enable or disable map interaction.
	func isInteractionEnabled(_ enabled: Bool) {
		isScrollEnabled = enabled
		isZoomEnabled = enabled
		isPitchEnabled = enabled
		isRotateEnabled = enabled
	}
}
