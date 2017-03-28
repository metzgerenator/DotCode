//
//  ProjectSizeViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/25/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ProjectSizeViewController: UIViewController {
    
    
    var delegate: nextButtonDelegate?
    
    var addProjectDelegate: NewProjectDictionaryDelegate?
    
    
    @IBOutlet var webSiteOutlet: UILabel!
    
    
    @IBOutlet var appOUtlet: UILabel!
    
    @IBOutlet var webAppOutlet: UILabel!
    

    @IBAction func nextButton(_ sender: Any) {
        
    
        
        delegate?.buttonPressed(page: 1)
        
        
    }
    

    
    
    @IBAction func webSiteAction(_ sender: UIButton) {
        
  
        addProjectDelegate?.appendToProject(key:JOBSIZE , value: WEBSITE)
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    @IBAction func appAction(_ sender: UIButton) {
        addProjectDelegate?.appendToProject(key:JOBSIZE , value: APP)
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    @IBAction func webAppAction(_ sender: UIButton) {
        addProjectDelegate?.appendToProject(key:JOBSIZE , value: WEBAPP)
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


//MARK: change button states 

extension ProjectSizeViewController {
    
    
    func setButtonBackgrounds(tagID: Int) {
        
        
        self.webSiteOutlet.backgroundColor = UIColor.white
        self.appOUtlet.backgroundColor = UIColor.white
        self.webAppOutlet.backgroundColor = UIColor.white
        
       // change this to switch on labels
        switch tagID {
        case 1:
            self.webSiteOutlet.backgroundColor = UIColor.gray
            
        case 2:
            self.appOUtlet.backgroundColor = UIColor.gray
            
        case 3:
            self.webAppOutlet.backgroundColor = UIColor.gray
        default:
            break
        }
        
    }
    
    
    
}








