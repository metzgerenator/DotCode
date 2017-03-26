//
//  JobDescriptionViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/25/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class JobDescriptionViewController: UIViewController {
    //default text if no change
    var saveDescription: String?
    
    var defaultText = "Please add an in-depth descritpion of the project"
    
    var delegate: nextButtonDelegate?
    var addProjectDelegate: NewProjectDictionaryDelegate?
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        delegate?.buttonPressed(page: 3)
        
    }
    
    
    
    @IBOutlet var desCriptionOutlet: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        desCriptionOutlet.delegate = self
        desCriptionOutlet.text = defaultText
    }

   
   

 
}

extension JobDescriptionViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if desCriptionOutlet.text == defaultText {
            desCriptionOutlet.text = ""
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if desCriptionOutlet.text.characters.count == 0 {
            desCriptionOutlet.text = defaultText
            saveDescription = nil
            addProjectDelegate?.appendToProject(key: PROJECTDESCRIPTION, value: "")
        } else {
            
            saveDescription = desCriptionOutlet.text
            
            if let description = saveDescription {
               addProjectDelegate?.appendToProject(key: PROJECTDESCRIPTION, value: description)
            }
            
        }
    }
    
}




