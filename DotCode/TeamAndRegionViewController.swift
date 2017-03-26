//
//  TeamAndRegionViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/25/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class TeamAndRegionViewController: UIViewController {
    
    
    var delegate: nextButtonDelegate?
    var addProjectDelegate: NewProjectDictionaryDelegate?
    //MARK: size selection outlet
    
    @IBOutlet var freeLancerOutlet: UILabel!
    
    @IBOutlet var smallTeamOutlet: UILabel!
    
    @IBOutlet var devShopOutlet: UILabel!
    
    
    
    
    //MARK: size selection action
    @IBAction func freelancerAction(_ sender: UIButton) {
        
        addProjectDelegate?.appendToProject(key: COMPANYSIZE, value: FREELANCERTYPE)
        setButtonBackgroundsForSize(tagID: sender.tag)
        
    }
    
   
    @IBAction func smallTeamAction(_ sender: UIButton) {
        
        addProjectDelegate?.appendToProject(key: COMPANYSIZE, value: SMALLTEAMTYPE)
        setButtonBackgroundsForSize(tagID: sender.tag)
    }
    
    
    @IBAction func devShopAction(_ sender: UIButton) {
        addProjectDelegate?.appendToProject(key: COMPANYSIZE, value: DEVSHOPTYPE)
        setButtonBackgroundsForSize(tagID: sender.tag)
        
    }
    
    
    
    //MARK: location selection outlets 
    
    
    
    @IBOutlet var sameCityOutlet: UILabel!

    @IBOutlet var sameRegionOutlet: UILabel!
    
    @IBOutlet var anyWhereOutlet: UILabel!
    
    
    
    //MARK: location selection actions
    
    
    
    @IBAction func sameCityAction(_ sender: UIButton) {
        
        
        addProjectDelegate?.appendToProject(key: USERLOCATION, value: SAMECITY)
        setButtonBackgroundsForRegion(tagID: sender.tag)
        
    }
    
    @IBAction func sameRegionAction(_ sender: UIButton) {
        
        addProjectDelegate?.appendToProject(key: USERLOCATION, value: SAMEREGION)
        setButtonBackgroundsForRegion(tagID: sender.tag)
        
    }
    
    
    @IBAction func anyWhereAction(_ sender: UIButton) {
        
        addProjectDelegate?.appendToProject(key: USERLOCATION, value: ANYWHERE)
        setButtonBackgroundsForRegion(tagID: sender.tag)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nextButton(_ sender: UIButton) {
        
        delegate?.buttonPressed(page: 2)
        
        
        
    }
    

}


extension TeamAndRegionViewController {
    
    func setButtonBackgroundsForSize(tagID: Int) {
        
        
        self.freeLancerOutlet.backgroundColor = UIColor.white
        self.smallTeamOutlet.backgroundColor = UIColor.white
        self.devShopOutlet.backgroundColor = UIColor.white
        
        // change this to switch on labels
        switch tagID {
        case 1:
            self.freeLancerOutlet.backgroundColor = UIColor.gray
            
        case 2:
            self.smallTeamOutlet.backgroundColor = UIColor.gray
            
        case 3:
            self.devShopOutlet.backgroundColor = UIColor.gray
        default:
            break
        }
        
    }

    

    
    func setButtonBackgroundsForRegion(tagID: Int) {
        
        
        self.sameCityOutlet.backgroundColor = UIColor.white
        self.sameRegionOutlet.backgroundColor = UIColor.white
        self.anyWhereOutlet.backgroundColor = UIColor.white
        
        // change this to switch on labels
        switch tagID {
        case 4:
            self.sameCityOutlet.backgroundColor = UIColor.gray
            
        case 5:
            self.sameRegionOutlet.backgroundColor = UIColor.gray
            
        case 6:
            self.anyWhereOutlet.backgroundColor = UIColor.gray
        default:
            break
        }
        
    }
    
    
    
}














