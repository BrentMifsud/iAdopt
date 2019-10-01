//
//  PetDetailsViewController+CollectionView.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

extension PetDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return petImages.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let petImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "petCollectionCell", for: indexPath) as! PetCollectionViewCell
		petImageCell.petImage = petImages[indexPath.row]

		return petImageCell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		#warning("Not Yet Implemented")
	}

	func setUpCollectionView(){
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "PetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "petCollectionCell")
	}
}
