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
    func updateItem(item: Item, sect: Int, row: Int)
}

class AddEditItemViewController: UIViewController {

    var delegate:AddEditItemDelegate?
    var section = 0
    var itemNo = 0
    var edit = false
    
    var oldName:String?
    var oldPrice:Double?
    
    @IBOutlet weak var itemNameTV: UITextField!
    @IBOutlet weak var itemPriceTV: UITextField!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if edit {
            self.itemNameTV.text = oldName!
            self.itemPriceTV.text = "\(oldPrice!)"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitItem(sender: AnyObject) {
        if edit {
            if (itemNameTV.text != oldName) || (Double(itemPriceTV.text!) != oldPrice) {
                let i = Item(item: itemNameTV.text!, price: Double(itemPriceTV.text!)!)
                delegate?.updateItem(i, sect: section, row: itemNo)
            }
        }else{
            delegate?.addItem(Item(), s:section)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelItem(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
