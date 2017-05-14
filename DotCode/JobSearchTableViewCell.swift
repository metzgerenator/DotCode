//
//  JobSearchTableViewCell.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobSearchTableViewCell: UITableViewCell {
    
    var currentUSerKeys = Dictionary<String, Any>()
    
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var studioNameLabel: UILabel!
    
    @IBOutlet var numberOfDaysAgo: UILabel!
    
    
     var currentJob: Job?
    
    @IBOutlet var isFaveroite: UIButton!
    
   
    
    @IBAction func isFavAction(_ sender: Any) {
        
        if let selectedJob = currentJob {
            
            let jobKey = selectedJob.jobKey
            
            let jobToSave = [JOBKEY: jobKey]
            
            if isFaveroite.backgroundColor == .red {
                
                isFaveroite.backgroundColor = .none
                
                //remove job
                
                removeJob(job: selectedJob)
                
         
            } else {
                //addjob
                appendCustomHeaderWithAutoID(child: SAVEDJOBS, values: jobToSave as Dictionary<String, AnyObject>)
                
                isFaveroite.backgroundColor = .red
                
            }
            
            
           
            
        }
        
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configureCell(job: Job, userKeys: Dictionary<String, Any>) {
        
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
        
        var isPresent = false
        
        for (_, savedDict) in self.currentUSerKeys {
            
            for (_, savedKey) in savedDict as! Dictionary<String,Any> {
                
                if savedKey as? String == job.jobKey {
                    
                    isPresent = true
                    
                }
                
                
            }
            
            
        }
        
        return isPresent
        
        }
        
    
    func removeJob(job: Job) {
        
        for (rootKey, savedDict) in self.currentUSerKeys {
            
            for (_, savedKey) in savedDict as! Dictionary<String,Any> {
                
                if savedKey as? String == job.jobKey {
                    
                    //delete here
                    removeJobValue(child: SAVEDJOBS, rootKey: rootKey)
                }
                
                
            }
            
            
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
