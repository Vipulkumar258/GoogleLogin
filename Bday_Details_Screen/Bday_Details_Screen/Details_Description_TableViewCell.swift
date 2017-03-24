//
//  Details_TableViewCell.swift
//  Bday_Details_Screen
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class Details_Description_TableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
