//
//  JobFilterViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 4/12/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobFilterViewController: UIViewController {
    
    
    
    @IBAction func doneButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "filter", sender: self)
    }
    
    
    

    @IBAction func distanceFilter(_ sender: Any) {
        
    
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation



}
