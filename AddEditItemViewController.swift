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
    var quantity = 1
    
    var oldItem:Item?
    
    @IBOutlet weak var itemNameTV: UITextField!
    @IBOutlet weak var itemPriceTV: UITextField!
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var decreaseQtyButton: UIButton!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if edit {
            self.itemNameTV.text = oldItem!.name
            self.itemPriceTV.text = "\(String(format: "%.2f",oldItem!.price))"
            self.quantity = oldItem!.quantity
        }
        updateQuantityInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func increaseQuantity(sender: AnyObject) {
        quantity+=1
        print(quantity)
        updateQuantityInfo()
    }
    
    func updateQuantityInfo(){
        if quantity == 1 { decreaseQtyButton.enabled = false }else { decreaseQtyButton.enabled = true }
        self.quantityLabel.text = "\(self.quantity)"
        if itemPriceTV.text == "" {
            totalPriceLabel.text = "$0.00"
        }else{
            totalPriceLabel.text = "$\(String(format: "%.2f",Double(itemPriceTV.text!)!*Double(quantity)))"
        }
    }
    
    func validate() -> Bool{
        
        let nm = itemNameTV.text
        let pr = Double(itemPriceTV.text!)
        
        if nm != nil && pr != nil { return true }
        else { return false }
    }
    
    @IBAction func decreaseQuantity(sender: AnyObject) {
        quantity-=1
        print(quantity)
        updateQuantityInfo()
    }
    
    @IBAction func submitItem(sender: AnyObject) {
        let valid = validate()
        if valid {
            if edit {
                if (itemNameTV.text != oldItem?.name) || (Double(itemPriceTV.text!) != oldItem?.price) || (Int(quantityLabel.text!) != oldItem?.quantity) {
                    let i = Item(item: itemNameTV.text!, price: Double(itemPriceTV.text!)!, qty: Int(quantityLabel.text!)!)
                    delegate?.updateItem(i, sect: section, row: itemNo)
                }
            }else{
                delegate?.addItem(Item(item: itemNameTV.text!, price: Double(itemPriceTV.text!)!, qty: self.quantity), s:section)
            }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelItem(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
