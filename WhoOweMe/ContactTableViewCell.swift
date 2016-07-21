//
//  ContactTableViewCell.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var person = Person()
    
    var contactSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if person.selected {
            self.backgroundColor = UIColor.greenColor()
        }
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func selectContact(sender: AnyObject) {
        print("selected contact")
        
        if person.selected == false {
            person.selected = true
            self.backgroundColor = UIColor.greenColor()
        }else {
            person.selected = false
            self.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
}
