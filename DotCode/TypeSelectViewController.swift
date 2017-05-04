//
//  TypeSelectViewController.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/18/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class TypeSelectViewController: UIViewController {
    
    
    @IBOutlet var amOutlet: UIButton!
    
    @IBOutlet var selectionView: UIStackView!
    
    @IBOutlet var needOutlet: UIButton!
    
    
    
    
    var currentTitle: String?

    
    
    @IBOutlet var devSelectOutlet: UIButton!
    
    @IBAction func amDevButton(_ sender: UIButton){
        
        devSelectOutlet.setTitle("am", for: .normal)
        currentTitle = DEVELOPER
        
    }
    
    
    @IBAction func notDev(_sender: UIButton) {
        
        devSelectOutlet.setTitle("need", for: .normal)
        currentTitle = CLIENT
    }
    
    
    
    @IBAction func devSelectButton(_ sender: UIButton) {
        
        //show hide labels
        var hideStack: Bool
        
        switch selectionView.isHidden {
        case true:
            
            hideStack = false
            
        case false:
            
            hideStack = true
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.selectionView.isHidden = hideStack
        }, completion: nil)

        
       
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        selectionView.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amOutlet.setFullBorder(borderColor: .gray)
        amOutlet.backgroundColor = .white
        
        needOutlet.setFullBorder(borderColor: .gray)
        needOutlet.backgroundColor = .white
        
        //Add barbutton
        let barButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(TypeSelectViewController.nextStep))
        self.navigationItem.rightBarButtonItem = barButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextStep() {
        
        if let clientType = currentTitle {
            
            switch clientType {
            case DEVELOPER:
                appendValues(values: [USERTYPE : DEVELOPER as AnyObject])
                self.performSegue(withIdentifier: "accountDetails", sender: self)
                
            case CLIENT:
                appendValues(values: [USERTYPE : CLIENT as AnyObject])
                self.performSegue(withIdentifier: "nonDev", sender: self)
            default:
                
               alertControllerView(title: "Select Usertype", message: "please select a user type")
            }
            
        } else {
            
            appendValues(values: [USERTYPE : DEVELOPER as AnyObject])
            
        }
        
        
        
        
        
        
    }
    


 

}


extension TypeSelectViewController {
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

