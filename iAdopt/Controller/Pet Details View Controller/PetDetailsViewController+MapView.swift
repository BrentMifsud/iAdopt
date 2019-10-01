//
//  PetDetailsViewController+MapView.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import MapKit

extension PetDetailsViewController: MKMapViewDelegate {
	/// Set up the MapView.
	func setUpMapView(){
		mapView.delegate = self

		let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
		let coordinate = CLLocationCoordinate2D(latitude: selectedPet.latitude, longitude: selectedPet.longitude)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		mapView.setRegion(region, animated: true)

		mapView.isInteractionEnabled(false)
	}
}
