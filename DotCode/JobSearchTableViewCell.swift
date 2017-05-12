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
    
    
    @IBOutlet var isFaveroite: UIButton!
    
    var currentJob: Job?
    
    @IBAction func isFavAction(_ sender: Any) {
        
        if let selectedJob = currentJob {
            
            let jobKey = selectedJob.jobKey
            
            let jobToSave = ["job_Key" :  jobKey]
            
            appendCustomHeader(child: "Saved Jobs", values: jobToSave as Dictionary<String, AnyObject>)
          isFaveroite.backgroundColor = .red
            
        }
        
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configureCell(job: Job) {
        
        currentJob = job
        
        descriptionLabel.text = job.description ?? "none"
        //add studio name
    
       studioNameLabel.text = "none"

        if let postDate = job.postDate {
            
            numberOfDaysAgo.text = dateNumberCreator(postDate: postDate)
        } else {
            
            numberOfDaysAgo.text = "none"
        }
        
        
        
    }
    
    
    
    func dateNumberCreator(postDate: String) -> String {
        
       let timeInput = Date(timeIntervalSince1970: Double(postDate)!)

        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: timeInput)
        let date2 = calendar.startOfDay(for: Date())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        let days = components.day ?? 0
    
       return ("\(days) days")
        
    }
    
    

}
