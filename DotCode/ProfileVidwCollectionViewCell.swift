//
//  ProfileVidwCollectionViewCell.swift
//  DotCode
//
//  Created by Aileen Taboy on 2/20/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorageUI


class ProfileVidwCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var skillLabel: UILabel!
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    let storage = FIRStorage.storage()
    
    
    func configureCell(skill: String) {
        
        
        skillLabel.text = skill
       // skillLabel.setFullBorder(borderColor: .blue)
   
        self.layer.cornerRadius = 26
        self.layer.masksToBounds = true
    
        imageOutlet.isHidden = true
    }
    
    
    
    
    func confirgureProjectCell(title:String, imageURL: String) {
        
        imageOutlet.isHidden = false
        self.layer.cornerRadius = 0
        
        let storageRef = storage.reference(forURL: imageURL)
        
        let placeholderImage = UIImage(named: "camera.jpg")
        
        let imageView: UIImageView = imageOutlet
        skillLabel.text = title
        
        
        let downloadTask = imageView.sd_setImage(with: storageRef, placeholderImage: placeholderImage)
        
        downloadTask?.observe(.failure) { snapshot in
            
            print("here is status \(snapshot.error)")
        }
        
    }
    
    
}
