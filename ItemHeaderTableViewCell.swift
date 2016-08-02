//
//  ItemHeaderTableViewCell.swift
//  WhoOweMe
//
//  Created by Nick Barton on 8/1/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class ItemHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addItem(sender: AnyObject) {
        print("added item")
    }
}
