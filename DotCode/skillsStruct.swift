//
//  skillsStruct.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/21/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase




class DeveloperSkills {
    
    var skillType: String?
    var subSkills: [String]?
    
    
    init() {
        
        
    }
    
    
    init(skillType: String, subSkills: [String]) {
        
        self.skillType = skillType
        self.subSkills = subSkills
        
        
    }
    
    
    
     func skillsFromDataBase(completion: @escaping (_ skills: [DeveloperSkills])->Void) {
        
        let ref = FIRDatabase.database().reference().child(DEVELOPERSKILLS)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let skillDic  = snapshot.value as? NSDictionary else { return }
            

            completion(self.snapShotParse(skillDic: skillDic))
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    
        
    }
    
    
      func snapShotParse(skillDic: NSDictionary)-> [DeveloperSkills] {
        var devSkillsArray = [DeveloperSkills]()
        
        for (skill, subSkill) in skillDic {
            
            
            let devSkill = DeveloperSkills(skillType: skill as! String, subSkills: subSkill as! Array<String>)
            devSkillsArray.append(devSkill)
        }
        
        return devSkillsArray
    }
    
    
    
    
}





class DevSelectSkils: DeveloperSkills {
    
   
    override func skillsFromDataBase(completion: @escaping ([DeveloperSkills]) -> Void) {
        
        guard let userId = FIRAuth.auth()?.currentUser?.uid else {return}
        
        let ref = FIRDatabase.database().reference().child("users").child(userId).child(DEVELOPERSKILLS)
        
        
        ref.observe(.value, with: { (snapshot) in
            
            guard let skillDic  = snapshot.value as? NSDictionary else { return }
            
            completion(self.snapShotParse(skillDic: skillDic))
        })
        
    }
    
}
















