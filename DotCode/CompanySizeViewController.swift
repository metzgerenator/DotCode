//
//  CompanySizeViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/12/17.
//  Copyright © 2017 Mike. All rights reserved.
//


import UIKit
import Firebase

class CompanySizeViewController: UIViewController {
    
    
    var companySize: String?
    
    @IBOutlet var companyNameField: UITextField!
    
    
    @IBOutlet var cityField: UITextField!
    
    @IBOutlet var websiteField: UITextField!
    
    @IBOutlet var emailField: UITextField!
    //companysize icons
    
    
    @IBOutlet var Entrepreneur: UILabel!
    
    @IBOutlet var Company: UILabel!
    
    
    
    @IBOutlet var saveButtonOutlet: UIButton!
    
    @IBAction func EntrepreneurAction(_ sender: UIButton) {
        
        companySize = Entrepeneur
        setButtonBackgrounds(tagID: sender.tag)
        
    }
    
    

    @IBAction func CompanyAction(_ sender: UIButton) {
        
        companySize = COMPANY
        
        setButtonBackgrounds(tagID: sender.tag)
    }
    
    
    
    func setButtonBackgrounds(tagID: Int) {
        
        
        
        self.Entrepreneur.backgroundColor = UIColor.white
        self.Company.backgroundColor = UIColor.white
        
        switch tagID {
        case 1:
            self.Entrepreneur.backgroundColor = UIColor.gray
            
        case 2:
            self.Company.backgroundColor = UIColor.gray
            
        default:
            break
        }
        
        
        
        
    }
    
    
    var devTypeTitle: String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navTitle = devTypeTitle {
            
            self.navigationItem.title = navTitle
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            self.companyNameField.text = Developer.companyName ?? ""
            
            //MARK: finish companysize selection
            if let companySize = Developer.companySize {
                
                
                switch companySize {
                    
                case Entrepeneur:
                    self.setButtonBackgrounds(tagID: 1)
                    self.companySize = Entrepeneur
                    
                case COMPANY:
                    self.setButtonBackgrounds(tagID: 2)
                    self.companySize = COMPANY
          
                    
                default:
                    break
                    
                }
                
                
                
            }
            
            self.cityField.text = Developer.location ?? ""
            self.websiteField.text = Developer.website ?? ""
            self.emailField.text = Developer.email ?? ""
            
            
        }
        
        setAttributes()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setAttributes() {
        
        companyNameField.setBottomBorder(borderColor: .gray)
        
        cityField.setBottomBorder(borderColor: .gray)
        websiteField.setBottomBorder(borderColor: .gray)
        emailField.setBottomBorder(borderColor: .gray)
        
        saveButtonOutlet.layer.cornerRadius = 5.0
        
        let border = CGFloat(0.5)
        let radius = CGFloat(5.0)
        
        
        Entrepreneur.layer.cornerRadius = radius
        Entrepreneur.clipsToBounds = true
        Entrepreneur.layer.borderWidth = border
        
        Company.layer.cornerRadius = radius
        Company.clipsToBounds = true
        Company.layer.borderWidth = border
        
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        if let location = cityField.text, let website = websiteField.text, let email = emailField.text, let companySize = companySize, let companyName = companyNameField.text {
            
            
            appendValues(values: [USERLOCATION : location as AnyObject, USERSWEBSITE : website as AnyObject, USERSEMAIL : email as AnyObject, COMPANYSIZE : companySize as AnyObject, COMPANYNAME : companyName as AnyObject])
            
            self.performSegue(withIdentifier: "description", sender: self)
        } else {
            
            userAlerts(title: "Fill in fields", message: "Please fill in all fields")
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    
     // MARK: - Navigation
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "description" {
            
            let vc = segue.destination as! ClientDescriptionViewController
            vc.name = companyNameField.text
            vc.location = cityField.text
            
            
        }
    
     }

    
}
//MARK: alert views

extension CompanySizeViewController {
    
    
    
    
    //MARK: general alert funciton
    func userAlerts(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}

