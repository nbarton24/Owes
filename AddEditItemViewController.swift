//
//  AddEditItemViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 8/1/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

protocol AddEditItemDelegate {
    func addItem(i: Item,s: Int)
}

class AddEditItemViewController: UIViewController {

    var delegate:AddEditItemDelegate?
    var section = 0
    
    @IBOutlet weak var itemNameTV: UITextField!
    @IBOutlet weak var itemPriceTV: UITextField!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitItem(sender: AnyObject) {
        delegate?.addItem(Item(), s:section)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelItem(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
