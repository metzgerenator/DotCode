//
//  AddPortfoliotCollectionReusableView.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 2/9/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class AddPortfoliotCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var titleLable: UILabel!
    
    var title: String? {
        
        didSet {
            
            titleLable.text  = title
        }
        
    }
    
    
    
}
