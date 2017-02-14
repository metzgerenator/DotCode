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
    
    @IBOutlet weak var DeveloperName: UIStackView!
    
    @IBOutlet weak var City: UILabel!
    
    
    @IBOutlet weak var website: UILabel!

    @IBOutlet weak var aboutMe: UILabel!
    
    
    @IBOutlet weak var skillsContainer: UIView!
    
    
    
    
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
