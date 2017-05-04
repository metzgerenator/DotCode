//
//  Users.swift
//  ObjectiveCApp
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase
import CoreLocation



struct User {
    
    var companyName: String?
    var city: String?
    var website: String?
    var userName: String?
    var companySize: String?
    
    
    init(snapShot: NSDictionary) {
        
        
        for (key, value) in snapShot {
            
            
            guard let keyCheck = key as? String else {continue}
            guard let valueCheck = value as? String else {continue}
            
            
            switch keyCheck {
            case CITY:
                self.city = valueCheck
                
            case COMPANYNAME:
                self.companyName = valueCheck
                
            case USERSWEBSITE:
                self.website = valueCheck
                
            case USERSNAME:
                self.userName = valueCheck
                
            case COMPANYSIZE:
                self.companySize = valueCheck
            default:
                break
            }
        
        }
       
      
        
        
        
        
        
    }
    
    
}





//MARK: Developer attributes


struct Developer {
    
    var email: String?
    var accountType: String?
    var userName: String?
    var website: String?
    var github: String?
    var phone: String?
    var location: String?
    
    var companyName: String?
    var companySize: String?
    
    var userAvailAbility: String?
    
    
    var developerType: String?
    
    
    var developerDescription: String?

    
    var previousClients: [String]?
    
    var userPhoto: String?
    
    var projects: [DeveloperProjects]?
    
    var developerSkills: [Skills]?
    
    var completedProfile: Bool?
    
    var latitude: String?
    
    var longitude: String?
    
    var userLocation: CLLocation?
    
    
    init() {
        
    }
    
    
    //MARK: finish cross checking with constants
    
    init(userdata: [String : AnyObject])  {
        
        if let devSkills = userdata[DEVELOPERSKILLS] {
            
            var developerSkillsArray = [Skills]()
            
            for (headSkill, subSkill) in devSkills as! Dictionary<String, AnyObject> {
                
                let headerSkill = headSkill
                var subSkillArray = [String]()
                
                for skill in subSkill as! NSMutableArray {
                    
                    subSkillArray.append(skill as! String)
                    
                }
                
                let finalSkill = Skills(headerSkill: headerSkill, subSkills: subSkillArray)
                developerSkillsArray.append(finalSkill)
                
            }
            self.developerSkills = developerSkillsArray
        }
        
        
        
        if let completedProfile = userdata[COMPLETEPROFILE] {
            
            guard let completed = completedProfile as? String else {return}
            
            
            if completed == "True" {
                
                self.completedProfile = true
            }
            
            
        }
        
        if let longitude = userdata[USERLONGITUDE], let latitude = userdata[USERLATITUED]{
            
            guard let lat = latitude as? String else {return}
            guard let lon = longitude as? String else {return}
            
            self.longitude = lat
            self.latitude = lon
            
            if let latNumber = Double(lat), let lonNumber = Double(lon) {
                
                self.userLocation = CLLocation(latitude: latNumber, longitude: lonNumber)
            }
            
//            self.longitude = longitude as? NSNumber
//            self.latitude = latitude as? NSNumber

        
            print("here is long lat \(String(describing: self.longitude)), \(String(describing: self.latitude))")
            
            
        }
        
        
        
        if let previousClients = userdata[PREVIOUSCLIENTS] {
            
            var newArray = [String]()
            
            for user in previousClients as! NSArray {
                
                if user is String {
                    
                    newArray.append(user as! String)
                    
                }
                
                self.previousClients = newArray
            }
        }
        
        
        
        if let userProjects = userdata[USERPROJECTS] {
            
            var projectTypeArray = [DeveloperProjects]()
            
            for (project, subDictionary) in userProjects as! Dictionary<String, AnyObject> {
                
                let projectName = project
                var photoURLS = [String]()
                var description: String!
                
                for item in subDictionary as! NSMutableArray {
                    
                    
                    for (key, value) in item as! NSDictionary {
                        
                        switch key as! String {
                        case PROJECTDESCRIPTION:
                            description = value as! String
                            
                        case PROJECTURLS:
                            photoURLS = value as! Array
                            
                        default:
                            continue
                        }
                        
                    }
                    
                  
                }
                let project = DeveloperProjects(projectName: projectName, pictures: photoURLS, descritpion: description)
                projectTypeArray.append(project)
                
            }
            
            self.projects = projectTypeArray
            
        }
        

        
        
        
        
        
        
        if let userImageURL = userdata[USERIMAGE] {
            
            self.userPhoto = userImageURL as? String
        
            
        }
        
        
        if let availability = userdata[USERAVAILABILITY] {
            
            self.userAvailAbility = availability as? String
            
        }
        
        
        if let description = userdata[COMPANYDESCRIPTION] {
            
            self.developerDescription = description as? String
            
        }
        
        if let email = userdata[USERSEMAIL] {
            
            self.email = email as? String
            
        }
        
        
        if let companySize = userdata[COMPANYSIZE] {
            
            self.companySize = companySize as? String
            
        }
        
        
        if let accountType = userdata[USERTYPE] {
            
            self.accountType = accountType as? String
            
        }
        
        
        if let userName = userdata[USERSNAME] {
            
            self.userName = userName as? String
            
        }
        
        
        if let website = userdata[USERSWEBSITE] {
            
            self.website = website as? String
            
        }
        

        
        if let location = userdata[USERLOCATION] {
            
            self.location = location as? String
            
        }
        
        
        if let devType = userdata[DEVELOPERTYPE] {
            
            self.developerType = devType as? String
            
        }
        
        if let companyName = userdata[COMPANYNAME] {
            
            self.companyName = companyName as? String
            
        }
        
        
       
    }
    

    
    

    
}




//MARK: account creation


func createAccount(user: FIRUser) {
    
    let ref = FIRDatabase.database().reference()
    
    guard let email = user.email else {return}
    
    let emailAttribute = ["email" : email]
    
    ref.child("users").child(user.uid).setValue(emailAttribute)

    
}



//MARK: append values

func appendValues(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid)
        ref.updateChildValues(values)

        
        
    }
    
  

    
}



func appendDevSkils(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid).child(DEVELOPERSKILLS)

        ref.updateChildValues(values)
 
        
    }
    
}


func appendCustomHeader(child: String, values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid).child(child)
        ref.updateChildValues(values)
        
    }
    
}


//MARK: add a new job POST 

func postAJob(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        
        let refSub = FIRDatabase.database().reference().child("users").child(user.uid).child("Job_Posts").childByAutoId()
        
        refSub.updateChildValues(values)
        
        var refMainDic = values
        refMainDic.updateValue(user.uid as AnyObject, forKey: "UID")
        let refMain = FIRDatabase.database().reference().child("Job_Posts").childByAutoId()
        refMain.updateChildValues(refMainDic)
        
        
    }
    
}




//MARK: Authentication State listener and user attributes


struct CurrentUser  {
    
    // need function for retriving photos
    
    //MARK: upload photos for projects
    
    func uploadPhotos(images: [UIImage], mainHeader: String?, description: String, child: String) {
        
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: "gs://dotcode-f2137.appspot.com").child("userimages")
        
        var imageURLS = [String]()
        for image in images {

            guard let imageToLoad = UIImageJPEGRepresentation(image, 0.2) else { return }
            let randomNumber = Int(arc4random_uniform(20000) + 1)
            let userImageRef = storageRef.child("\(randomNumber).jpg")
            
            
                    let imageReference = "\(userImageRef)"
                    
                    imageURLS.append(imageReference)

            
            userImageRef.put(imageToLoad, metadata: nil) { (metadata, error) in
                
                if error == nil {
                    
                    //MARK: deal with error handeling !!
        
                } else {
                    
                    print("error occured \(String(describing: error))")
                    
                }
                
            }
            
        
        
        }
        
        var dictionaryArray = [AnyObject]()
        let dictionary1 =  [PROJECTDESCRIPTION : description]
        let dictionary2 = [PROJECTURLS : imageURLS]
        
        dictionaryArray.append(dictionary1 as AnyObject)
        dictionaryArray.append(dictionary2 as AnyObject)
        
        
        
        let values = [mainHeader! : dictionaryArray]
    
        appendCustomHeader(child: child, values: values as Dictionary<String, AnyObject>)
    }
    
    
    func getCurrentPhoto(imageURL: String, completion: @escaping (UIImage?, _ error: Bool, _ errorMessage: String) -> Void) {
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: imageURL)
        
        storageRef.data(withMaxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                
                completion(nil, true, error.localizedDescription)
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                
                completion(image, false, "")
                
                
            }
        }
        
        
    }
    
    
    
     func userAttributes(completion: @escaping (Developer) -> Void) {
        
        guard let userId = FIRAuth.auth()?.currentUser?.uid else {return}
        
        let ref = FIRDatabase.database().reference().child("users").child(userId)
        
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let skillDic = snapshot.value as? NSDictionary else { return }
            
            
            let developer = Developer(userdata: skillDic as! [String : AnyObject])
            
            completion(developer)
            
            
        })
        
    }
   
    func checkUSerStatus(completion: @escaping (_ userLogged: Bool)->Void)  {
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            
            if user != nil {
                
                completion(true)
                
            } else {
                
                completion(false)
                
            }
            
            
            
        }
        
    }
    

    
}


//MARK: DeveloperProjects Struct

struct DeveloperProjects {
    var projectName: String
    var pictures: [String]
    var descritpion: String?
  
}

struct Skills {
    
    var headerSkill: String
    var subSkills: [String]?
    
}












