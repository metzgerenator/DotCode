//
//  SkillsAndAvailabilityCollectionViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 2/1/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorageUI

class SkillsAndAvailabilityCollectionViewCell: UICollectionViewCell {
    @IBOutlet var projectLabel: UILabel!
    

    @IBOutlet var projectPhoto: UIImageView!
    
    let storage = FIRStorage.storage()
    
    
    
    func configureCell(project: DeveloperProjects) {
        
        
        let projectURL = project.pictures[0]
        let storageRef = storage.reference(forURL: projectURL)
                
        let placeholderImage = UIImage(named: "camera.jpg")
    
        let imageView: UIImageView = projectPhoto
    
        
        let downloadTask = imageView.sd_setImage(with: storageRef, placeholderImage: placeholderImage)
        
        downloadTask?.observe(.failure) { snapshot in
            
            print("here is status \(snapshot.error)")
        }
        
        projectLabel.text = project.projectName
        
    }
    
    

    
}
