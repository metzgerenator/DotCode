//
//  JobSearchViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit
import CoreLocation

class JobSearchViewController: UIViewController {
    
    var allJobs = [Job]()
    var currentUSerLocation: CLLocation?
    //filter options 
    
    var filterByDistance = false
    
    @IBOutlet var tableView: UITableView!
    
    
    @IBAction func unwindFromFilter(segue: UIStoryboardSegue) {
        
        if segue.identifier == "filter" {
            //sortfunction
            
            filterOKCheck()
            
        }
    }
    
    
    
    
    func filterOKCheck() {
        
        if (!filterByDistance) {
            filterByDistance = true
            sortByDistance()
        } else {
            
            filterByDistance = false
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //get user location 
        let user = CurrentUser.init()
        user.userAttributes { (Developer) in
            guard let userCordinates = Developer.userLocation else {return}
            
            self.currentUSerLocation = userCordinates
            self.currentJobPostings()
            
        }
  
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
    
    
    func sortByDistance() {
        
       
        self.allJobs = allJobs.sorted(by: {$0.distanceToJob! > $1.distanceToJob!} )
        
        self.tableView.reloadData()

    }
    
    
}








