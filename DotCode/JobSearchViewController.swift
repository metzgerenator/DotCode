//
//  JobSearchViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobSearchViewController: UIViewController {
    
    var allJobs = [Job]()
    
    @IBOutlet var tableView: UITableView!
    
    
    @IBAction func unwindFromFilter(segue: UIStoryboardSegue) {
        
        if segue.identifier == "filter" {
            
            print("filtering")
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentJobPostings()
        
//        currentJobPostings { (Job) in
//            
//            
//            let check = self.allJobs.contains{$0.jobKey == Job.jobKey}
//            if (!check) {
//                self.allJobs.append(Job)
//                self.tableView.reloadData()
//            }
//            
//            
//
//        }

    }

 
    

  

}



extension JobSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allJobs.count
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! JobSearchTableViewCell
        
        let currentJob = allJobs[indexPath.row]
        cell.configureCell(job: currentJob)
        
        return cell
    }
    
}



extension JobSearchViewController {
    
    //filter function
    
}






