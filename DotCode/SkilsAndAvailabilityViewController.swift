//
//  SkilsAndAvailabilityViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/19/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SkilsAndAvailabilityViewController: UIViewController {
    
    
    
    var currentUSer: User?
    
    var userAvailability: String?
    
    var userProjects = [DeveloperProjects]()
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    @IBOutlet var longTermOutlet: UIButton!
    
    
    @IBOutlet var shorTermOutlet: UIButton!
    
    
    @IBOutlet var contractOutlet: UIButton!
    
    
    @IBOutlet var photoButtonOutlet: UIButton!

    @IBAction func photoButton(_ sender: UIButton) {
        
        
        
    }
    
    
    
    @IBAction func saveActionButton(_ sender: Any) {
        
        //Set user defaults 
        let prefs = UserDefaults.standard
        prefs.set(true, forKey: COMPLETEPROFILE)
        prefs.set(CLIENT, forKey: USERTYPE)
        
        
        if let userAvailability = userAvailability {
            
            
            appendValues(values: [USERAVAILABILITY : userAvailability as AnyObject])
            
            appendValues(values: [COMPLETEPROFILE : "True" as AnyObject])
        }
        
        
    }
    
    
    
    
    @IBAction func longTermAction(_ sender: UIButton) {
        
        userAvailability = LONGTERM
        setButtonBackgrounds(tagID: sender.tag)
        
        
    }
    
    
   
    
    
    @IBAction func shortTermAction(_ sender: UIButton) {
        userAvailability = SHORTTERM
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    @IBAction func contractAction(_ sender: UIButton) {
        
        userAvailability = CONTRACT
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            
            let cellOne = DeveloperProjects(projectName: "Click to Add", pictures: [""], descritpion: "")
            
            if let userProjects = Developer.projects {
                
                self.userProjects = userProjects
                
                self.userProjects.insert(cellOne, at: 0)
                //MARK: reload collection view here
                self.collectionView.reloadData()
                
            } else if self.userProjects.count == 0 {
                    
                    self.userProjects.insert(cellOne, at: 0)
                    self.collectionView.reloadData()
                    
                    
                }
                
            
            
            
            
            
            if let userPhoto = Developer.userPhoto {
                
                let currentUser = CurrentUser()
                currentUser.getCurrentPhoto(imageURL: userPhoto, completion: { (userImage, error, errorMessage) in
                    
                    if error == false {
                
                        self.photoButtonOutlet.setImage(userImage! as UIImage, for: .normal)
                        self.photoButtonOutlet.contentMode = UIViewContentMode.scaleAspectFit
                        
                    } else {
                        print("here is the error \(errorMessage)")
                    }
                    
                })
                
            }
            
            
            if let availability = Developer.userAvailAbility {
                
                
                
                switch availability {
                    
                case LONGTERM:
                    self.setButtonBackgrounds(tagID: 1)
                    self.userAvailability = LONGTERM
                    
                case SHORTTERM:
                    self.setButtonBackgrounds(tagID: 2)
                    self.userAvailability = SHORTTERM
                    
                case CONTRACT:
                    self.setButtonBackgrounds(tagID: 3)
                    self.userAvailability = CONTRACT
                    
                default:
                    break
                    
                }
                
                
                
            }
            
            
        }
        

        
        setAttributes()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}



extension SkilsAndAvailabilityViewController {
    
    
    func setButtonBackgrounds(tagID: Int) {
        
        
        
        self.longTermOutlet.backgroundColor = UIColor.white
        self.shorTermOutlet.backgroundColor = UIColor.white
        self.contractOutlet.backgroundColor = UIColor.white
        
        switch tagID {
        case 1:
            self.longTermOutlet.backgroundColor = UIColor.gray
            
        case 2:
            self.shorTermOutlet.backgroundColor = UIColor.gray
            
        case 3:
            self.contractOutlet.backgroundColor = UIColor.gray
        default:
            break
        }
        
        
        
        
    }
    
    
    
    
    
    func setAttributes() {
    
        let border = CGFloat(0.5)
        let radius = CGFloat(5.0)
        
        
        longTermOutlet.layer.cornerRadius = radius
        longTermOutlet.clipsToBounds = true
        longTermOutlet.layer.borderWidth = border
        
        shorTermOutlet.layer.cornerRadius = radius
        shorTermOutlet.clipsToBounds = true
        shorTermOutlet.layer.borderWidth = border
        
        contractOutlet.layer.cornerRadius = radius
        contractOutlet.clipsToBounds = true
        contractOutlet.layer.borderWidth = border
        
        
    }
    
    
    
}


extension SkilsAndAvailabilityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indexCheck = indexPath.row
        let project = userProjects[indexPath.row]
        
        if indexCheck == 0 {
            
            self.performSegue(withIdentifier: "portfolio", sender: self)
            
        } else {
            
            self.performSegue(withIdentifier: "notNew", sender: project)
            
        }
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userProjects.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SkillsAndAvailabilityCollectionViewCell
        
        let indexCheck = indexPath.row
        
        if indexCheck == 0 {
            
            cell.projectLabel.text = "Click to Add"
            cell.projectPhoto.image = UIImage(named: "camera")
            
        } else {
            
            let project = userProjects[indexPath.row]
            cell.configureCell(project: project)
            
        }
        
       
        
        return cell
    }
    
}


//MARK: navigation 



extension SkilsAndAvailabilityViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notNew" {
            
            let navControler = segue.destination as! UINavigationController
            let vc = navControler.topViewController as! AddtoPortFolioViewController
            
            
             guard let itemToSend = sender as? DeveloperProjects else {return}
            vc.selectedProject = itemToSend
            
            
        }
    }
    
    
}












