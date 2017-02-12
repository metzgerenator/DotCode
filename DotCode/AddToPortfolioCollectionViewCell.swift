//
//  AddToPortfolioCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorageUI

class AddToPortfolioCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var cellPhoto: UIImageView!
    
    let storage = FIRStorage.storage()
    
    func configureCell(image: UIImage) {
        
        
        cellPhoto.image = image
        
        
    }
    
    
    
    func configureLoadCell(url: String) {
        
        let storageRef = storage.reference(forURL: url)
        
        let placeholderImage = UIImage(named: "camera.jpg")
        
        let imageView: UIImageView = cellPhoto
        
        
        let downloadTask = imageView.sd_setImage(with: storageRef, placeholderImage: placeholderImage)
        
        downloadTask?.observe(.failure) { snapshot in
            
            print("here is status \(snapshot.error)")
        }
        
        
    }
    
    
    
    
}




    
