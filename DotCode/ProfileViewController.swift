//
//  ProfileViewController.swift
//  DotCode
//
//  Created by Aileen Taboy on 2/13/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var DeveloperName: UILabel!
    
    @IBOutlet weak var City: UILabel!
    
    
    @IBOutlet weak var website: UILabel!

    @IBOutlet weak var aboutMe: UILabel!
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    var headerSkills = [String]()
    var developerProjects = [DeveloperProjects]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser  = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            //MARK: fix conflict here
            
            if let projects = Developer.projects {
                
                self.developerProjects = projects
                self.collectionView.reloadData()
                
            }
            
            if let name = Developer.userName {
                
                self.DeveloperName.text = name
            
            }
            
            if let companyName = Developer.companyName {
                
                 self.DeveloperName.text = companyName
            }
            
            
            if let location = Developer.location {
                
                self.City.text = location
            }
            
            
            if let description = Developer.developerDescription {
                
                self.aboutMe.text = description
                
            }
            
            if let website = Developer.website {
                
                self.website.text = website
            }
            
            
            if let developerSkills = Developer.developerSkills {
                
                for skill in developerSkills {
                    
                    self.headerSkills.append(skill.headerSkill)
                }
                
                self.collectionView.reloadData()
                
            }
            
            
            
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return headerSkills.count
        } else {
            
            return developerProjects.count
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath)  as! ProfileViewCollectionReusableView
        
        if indexPath.section == 0 {
            
            sectionHeader.title = "Skills"
        } else {
            
            sectionHeader.title = "Projects"
        }
        
        return sectionHeader
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProfileVidwCollectionViewCell
        
        if indexPath.section == 0 {
            let skillToConfigure = headerSkills[indexPath.row]
            cell.configureCell(skill: skillToConfigure)
            return cell
            
        } else {
            
            let project = developerProjects[indexPath.row]
            cell.confirgureProjectCell(title: project.projectName, imageURL: project.pictures[0])
            return cell
            
        }
        
        
        
    }
    
    
}








