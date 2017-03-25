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
    
    
    

    @IBAction func nextButton(_ sender: Any) {
        
        delegate?.buttonPressed(page: 1)
        
        
    }
    
    @IBOutlet var webSiteOutlet: UIButton!
    
    @IBOutlet var appOutlet: UIButton!
    
    
    @IBOutlet var webAppOutlet: UIButton!
    
    
    @IBAction func webSiteAction(_ sender: Any) {
        
    }
    
    @IBAction func appAction(_ sender: Any) {
        
        
    }
    
    @IBAction func webAppAction(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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




