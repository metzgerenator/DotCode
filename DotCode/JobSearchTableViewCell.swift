//
//  JobSearchTableViewCell.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobSearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var studioNameLabel: UILabel!
    
    @IBOutlet var numberOfDaysAgo: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configureCell(job: Job) {
        
        
        descriptionLabel.text = job.description ?? "none"
        //add studio name
       studioNameLabel.text = "none"
        numberOfDaysAgo.text = job.postDate ?? "none"
        
        
    }
    
    

}
