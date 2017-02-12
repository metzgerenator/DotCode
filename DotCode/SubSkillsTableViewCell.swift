//
//  SubSkillsTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/23/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class SubSkillsTableViewCell: UITableViewCell {
    
    
  
    
    var delegate: SubSkillsTableViewCellDelegate?
    
    
    @IBOutlet var subSkillLabel: UILabel!
    
    
    @IBOutlet var selectSkillOutlet: UIButton!
    
    
    @IBAction func selectSkill(_ sender: Any) {
        
        
        let labelBackgroundColor = selectSkillOutlet.backgroundColor!
        
        switch labelBackgroundColor {
        case UIColor.green:
            selectSkillOutlet.backgroundColor = UIColor.black
            delegate?.updatesubSkills(subSkill: subSkillLabel.text!, delete: true)
            
        case UIColor.black:
            selectSkillOutlet.backgroundColor = UIColor.green
            delegate?.updatesubSkills(subSkill: subSkillLabel.text!, delete: false)
        default:
            selectSkillOutlet.backgroundColor = UIColor.green
            delegate?.updatesubSkills(subSkill: subSkillLabel.text!, delete: false)
            
            
            
        }
        
        
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configueCell(subSkill: String, userSelectSkills: [DeveloperSkills], currentMainSkill: DeveloperSkills) {
        
        
        subSkillLabel.text = subSkill
        
        selectSkillOutlet.backgroundColor = UIColor.black
        
        // determine if button should be green 
        
        for headerSkill in userSelectSkills {
            
            if headerSkill.skillType == currentMainSkill.skillType {
                
                for userSubSkill in headerSkill.subSkills! {
                    
                    if userSubSkill == subSkill {
                        selectSkillOutlet.backgroundColor = UIColor.green
                    }
                    
                }
                
            }
            
        }
     
    
       
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


protocol SubSkillsTableViewCellDelegate {
    func updatesubSkills(subSkill: String, delete: Bool)
    
    
}





