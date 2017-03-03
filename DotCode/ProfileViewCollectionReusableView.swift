//
//  ProfileViewCollectionReusableView.swift
//  DotCode
//
//  Created by Aileen Taboy on 3/2/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ProfileViewCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        
        didSet {
            
            titleLabel.text  = title
        }
        
    }
        
}
