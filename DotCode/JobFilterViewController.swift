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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "filter" {
            
            
            
        }

    }


}
