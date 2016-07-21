//
//  AddPersonTableViewCell.swift
//  WhoOweMe
//
//  Created by Nicholas Barton on 7/20/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

protocol AddPersonTVDelegate {
    func addValue(value: Int)
}

class AddPersonTableViewCell: UITableViewCell {

    var delegate: AddPersonTVDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        print("Button pressed")
        delegate?.addValue(35)
        print("Still Here")
    }
    
}
