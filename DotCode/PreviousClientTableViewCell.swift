//
//  PreviousClientTableViewCell.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 1/4/17.
//  Copyright © 2017 Michael Metzger . All rights reserved.
//

import UIKit

class PreviousClientTableViewCell: UITableViewCell {

    @IBOutlet var ClientName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func conFigureCell(inputName: String)  {
        ClientName.text = inputName 
    }
    

}
