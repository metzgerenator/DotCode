//
//  JobSearchTableViewCell.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobSearchTableViewCell: UITableViewCell {
    
    var currentUSerKeys = [String]()
    
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var studioNameLabel: UILabel!
    
    @IBOutlet var numberOfDaysAgo: UILabel!
    
    
     var currentJob: Job?
    
    @IBOutlet var isFaveroite: UIButton!
    
   
    
    @IBAction func isFavAction(_ sender: Any) {
        
        //need to add removal check
        if let selectedJob = currentJob {
            
            let jobKey = selectedJob.jobKey
            
            let jobToSave = [JOBKEY: jobKey]
  
            appendCustomHeaderWithAutoID(child: SAVEDJOBS, values: jobToSave as Dictionary<String, AnyObject>)

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
    
    
    func configureCell(job: Job, userKeys: [String]) {
        
        self.currentUSerKeys = userKeys
        
        currentJob = job
        
        let keyCheck = isJobKeyPresent(job: job)
        
        if (keyCheck) {
            isFaveroite.backgroundColor = .red
        } else {
            isFaveroite.backgroundColor = .none
        }
        
        descriptionLabel.text = job.description ?? "none"
        //add studio name
    
       studioNameLabel.text = job.companyName ??  "none"

        if let postDate = job.postDate {
            
            numberOfDaysAgo.text = dateNumberCreator(postDate: postDate)
        } else {
            
            numberOfDaysAgo.text = "none"
        }
  
    }
    
    
    func isJobKeyPresent(job: Job) -> Bool {
        
       return self.currentUSerKeys.contains{$0 == job.jobKey}
        
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
