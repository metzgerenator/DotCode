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
            //sortfunction

            sortByDistance()
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentJobPostings()
        


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

//MARK: convienece methods 

extension JobSearchViewController {
    
    // pull users long and lat
    
    // sort function 
    
    //create new sorted array and reload 
    
    func sortByDistance() {
        
        for job in allJobs {
            
            print("job latitude is \(String(describing: job.longitude)), job lat is \(String(describing: job.latitude))")
        }
        
    }
    
    
}








