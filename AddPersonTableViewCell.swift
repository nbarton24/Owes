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

    // MARK - Outlets
    
    // MARK - Variables
    var delegate: AddPersonTVDelegate?
    
    // MARK - View and System Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK - Actions
    //When the add button is pressed
    @IBAction func buttonPressed(sender: AnyObject) {
        delegate?.addValue(35)
    }
    
}
