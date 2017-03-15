//
//  DescriptionViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger on 1/20/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    
    var saveDescription: String?
    
    var defaultText = "Tell us a bit about yourself"
    
    
    @IBAction func saveProfileButton(_ sender: Any) {
        
        
        if let saveDescription = saveDescription {
            
            appendValues(values: [COMPANYDESCRIPTION : saveDescription as AnyObject])
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var descriptionOutlet: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let developer = CurrentUser()
        developer.userAttributes { (Developer) in
            
            if let description = Developer.developerDescription {
                
                self.descriptionOutlet.text = description
                self.saveDescription = description
            }
            
        
            
        }
        
        
        
        
        descriptionOutlet.delegate = self
        descriptionOutlet.text = defaultText

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


extension DescriptionViewController: UITextViewDelegate {
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionOutlet.text == defaultText {
            descriptionOutlet.text = ""
        }
        
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionOutlet.text.characters.count == 0 {
            descriptionOutlet.text = defaultText
            saveDescription = nil
        } else {
            
            saveDescription = descriptionOutlet.text
            
        }
    }
    
    
    
}
