//
//  JobSearchViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobSearchViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentJobPostings { (Job) in
            
        }

    }

 
    

  

}



extension JobSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! JobSearchTableViewCell
        
        
        return cell
    }
    
}
