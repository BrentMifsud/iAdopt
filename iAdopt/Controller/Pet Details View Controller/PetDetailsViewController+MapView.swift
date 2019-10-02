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

	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

		let reuseId = "pin"

		var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView

		if pinView == nil {
			pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
			pinView!.canShowCallout = false
			pinView!.markerTintColor = .systemGreen
		} else {
			pinView!.annotation = annotation
		}

		pinView?.isSelected = false
		pinView?.isUserInteractionEnabled = false

		return pinView
	}


	// MARK: - Helper functions

	/// Set up the MapView.
	func setUpMapView(){
		mapView.delegate = self

		let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
		let coordinate = CLLocationCoordinate2D(latitude: pet.latitude, longitude: pet.longitude)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		mapView.setRegion(region, animated: true)

		addPin(coordinate: CLLocationCoordinate2D(latitude: pet.latitude, longitude: pet.longitude))

		mapView.isInteractionEnabled(false)
	}

	/// Add pin to map
	func addPin(coordinate: CLLocationCoordinate2D){
		let annotation = MKPointAnnotation()
		annotation.coordinate = coordinate

		DispatchQueue.main.async {
			self.mapView.addAnnotation(annotation)
		}
	}
}
