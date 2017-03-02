//
//  ProfileVidwCollectionViewCell.swift
//  DotCode
//
//  Created by Aileen Taboy on 2/20/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ProfileVidwCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var skillLabel: UILabel!
    
    
    
    
    func configureCell(skill: String) {
        
        
        skillLabel.text = skill
       // skillLabel.setFullBorder(borderColor: .blue)
   
        self.layer.cornerRadius = 26
        self.layer.masksToBounds = true
    
        
    }
    
    
    
    
    
}
