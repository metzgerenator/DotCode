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
    var postDate: Date?
    var uId: String?
    var companySize: String?
    
    
}

struct allJobs {
    
    var currentJobs: [Job]?
}


func currentJobPostings(completion: @escaping (allJobs) -> Void) {
    
    //guard let userId = FIRAuth.auth()?.currentUser?.uid else {return}
    
    let ref = FIRDatabase.database().reference().child("Job_Posts")
    
    
    ref.observe(.value, with: { (snapshot) in
        
        //guard let JobDic = snapshot.value as? NSDictionary else { return }
        
        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        
        let json = JSON(postDict)
        
        for (key,subJson):(String, JSON) in json {
            
            if let jobDescription = subJson[PROJECTDESCRIPTION].string {
                print("here is description \(jobDescription)")
            }
        }
 
        
    })
    
}

