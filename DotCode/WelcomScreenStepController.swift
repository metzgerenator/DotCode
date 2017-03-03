//
//  WelcomScreenStepController.swift
//  TimeTracker
//
//  Created by Michael Metzger  on 2/18/17.
//  Copyright © 2017 CreativeWorx. All rights reserved.
//

import UIKit

class WelcomScreenStepController: UIViewController {
    @IBOutlet var welcomeImage: UIImageView!
    
    
    @IBOutlet var headerLabel: UILabel!

    @IBOutlet var messageLabel: UILabel!
    
    var mainImage: UIImage?
    var headerTitle: String?
    var mainMessage: String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        welcomeImage.image = mainImage
        headerLabel.text = headerTitle
        messageLabel.text = mainMessage
        
        
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
