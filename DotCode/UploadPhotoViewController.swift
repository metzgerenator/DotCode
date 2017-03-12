//
//  UploadPhotoViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/3/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class UploadPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var storage: FIRStorage?
    var storageRef: FIRStorageReference?
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

    @IBOutlet var userImage: UIImageView!

    
    @IBAction func uploadPhoto(_ sender: Any) {
        
        let picker  = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        
        picker.sourceType = .camera
        picker.modalPresentationStyle = .fullScreen
        
        
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func selectFromPhotoLibrary(_ sender: UIButton) {
        let picker  = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        
        picker.sourceType = .photoLibrary
        picker.modalPresentationStyle = .formSheet
        
        
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let imageSelected = userImage.image else {return}
        
        guard let imageToLoad = UIImageJPEGRepresentation(imageSelected, 0.2) else { return }
        
        let randomNumber = Int(arc4random_uniform(20000) + 1)
        let userImageRef = storageRef?.child("\(randomNumber).jpg")
        
        
        userImageRef!.put(imageToLoad, metadata: nil) { (metadata, error) in
            
            if error == nil {
                
                appendValues(values: [USERIMAGE : "\(userImageRef!)" as AnyObject])
                
            } else {
                
                //dialog letting them know something went wrong
                
            }
    
        }
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        storage = FIRStorage.storage()
         storageRef = storage?.reference(forURL: "gs://dotcode-f2137.appspot.com").child("userimages")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            
            self.userImage.image = image as? UIImage
            dismiss(animated: true, completion: nil)
            
        }
    }
    

}


