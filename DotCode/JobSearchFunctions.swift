//
//  JobSearchFunctions.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/27/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON



struct Job {
    var jobKey: String?
    var description: String?
    var jobPostName: String?
    var jobSize: String?
    var location: String?
    var postDate: String?
    var uId: String?
    var companySize: String?
    //add latitude and longitude 
    
    
    init() {}
    
    
}

extension JobSearchViewController {
    
    
    
    func currentJobPostings(){
        
        
        let ref = FIRDatabase.database().reference().child("Job_Posts")
        
        ref.observe(.value, with: { (snapshot) in
            
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            let json = JSON(postDict)
            var serverJobs = [Job]()
            // may need to equal nil 
            
            
            for (key,subJson):(String, JSON) in json {
                var job = Job()
                job.jobKey = key
                if let jobDescription = subJson[PROJECTDESCRIPTION].string {
                    
                    job.description = jobDescription
                }
                
                if let jobPostName = subJson[JOBPOSTNAME].string {
                    
                    job.jobPostName = jobPostName
                    
                }
                
                if let jobPostSize = subJson[JOBSIZE].string {
                    
                    job.jobSize = jobPostSize
                    
                }
                if let jobLocation = subJson[USERLOCATION].string {
                    
                    job.location = jobLocation
                }
                
                if let jobPostDate = subJson[JOBPOSTDATE].string {
                    
                    job.postDate = jobPostDate
                }
                
                if let posterID = subJson["UID"].string {
                    job.uId = posterID
                    
                }
                
                if let requiredSize = subJson[COMPANYSIZE].string {
                    
                    job.companySize = requiredSize
                    
                }
                
                serverJobs.append(job)
                
            }
            
            self.allJobs = serverJobs
            self.tableView.reloadData()
        })
        
    }
    
}


