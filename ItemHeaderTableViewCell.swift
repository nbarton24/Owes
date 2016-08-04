//
//  ItemHeaderTableViewCell.swift
//  WhoOweMe
//
//  Created by Nick Barton on 8/1/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

protocol ItemAddDelegate {
    func newItem(s:Int)
}

class ItemHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    var delegate: ItemAddDelegate?
    var section = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addItem(sender: AnyObject) {
        delegate?.newItem(section)
    }
}
