//
//  SubSkillsTableViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/23/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SubSkillsTableViewController: UITableViewController {
    
    
    var skillSet: DeveloperSkills?
    
    var userSelectSkills: [DeveloperSkills]?
    
   // var cellColorLabels: Dictionary<UIColor, String> = [:]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return skillSet?.subSkills?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubSkillsTableViewCell
        
         let subSkill = skillSet?.subSkills?[indexPath.row]
        
        cell.delegate = self

        if let skillCheck = subSkill, let userSkills = userSelectSkills, let currentMainSkill = skillSet {
            
            cell.configueCell(subSkill: skillCheck, userSelectSkills: userSkills, currentMainSkill: currentMainSkill)
            
            
        }
        
        
        return cell
    }
 

 

}



extension SubSkillsTableViewController: EditSkillsTableViewControllerDelegate, SubSkillsTableViewCellDelegate {
    
    //called everytime user updates
    func updateUserSelectSkills(userSelectSkills: [DeveloperSkills]) {
        
        self.userSelectSkills = userSelectSkills
        
        self.tableView.reloadData()
        
        
    }
    
    
    
    
    //MARK: update accuracy
    func updatesubSkills(subSkill: String, delete: Bool) {
        
        //match main skill 
        
        
        var userSubSkills = skillSet?.subSkills!
        
        for mainSkills in userSelectSkills! {
            
            if mainSkills.skillType == skillSet?.skillType {
                
              userSubSkills = mainSkills.subSkills!
                
            }
            
            
        }
        

        
        if (delete) {
            userSubSkills = userSubSkills?.filter{$0 != subSkill}
        }
        
        let values = [skillSet!.skillType! : userSubSkills]
        
        
        appendDevSkils(values: values as Dictionary<String, AnyObject>)
        

        
    }
    
    
    
}




