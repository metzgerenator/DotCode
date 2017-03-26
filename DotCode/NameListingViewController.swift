//
//  NameListingViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/25/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class NameListingViewController: UIViewController {
    
    var addProjectDelegate: NewProjectDictionaryDelegate?
    var saveProjectDelegate: SaveNewProjectDelegate?

    
    @IBOutlet var projectNameOutlet: UITextField!
    
    @IBAction func postActionButton(_ sender: Any) {
        
        if (projectNameOutlet.text?.characters.count)! > 0 {
            //append name of job
            addProjectDelegate?.appendToProject(key: JOBPOSTNAME, value: projectNameOutlet.text!)
            addProjectDelegate?.appendToProject(key: JOBPOSTDATE, value: "\(Date())")
            //save project
            saveProjectDelegate?.postJob()

        }
        
        
        
       self.dismiss(animated: true, completion: nil)
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
