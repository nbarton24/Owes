//
//  SplitItemsViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/22/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class SplitItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ItemAddDelegate, AddEditItemDelegate {

    var people = [Person]()
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.peopleTableView.registerNib(UINib(nibName: "ItemTableViewCell",bundle: nil), forCellReuseIdentifier: "ItemCell")
        self.peopleTableView.registerNib(UINib(nibName: "ItemHeaderTableViewCell", bundle:nil), forCellReuseIdentifier: "PersonHeader")
        self.peopleTableView.backgroundColor = UIColor.clearColor()
        let i = Item(item: "Food", price: 8.99, qty: 1)
        let i2 = Item(item: "Beer", price: 4.99, qty: 2)
        for p in people {
            p.items.insert(i, atIndex: 0)
            p.items.insert(i2, atIndex: 0)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people[section].items.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = peopleTableView.dequeueReusableCellWithIdentifier("PersonHeader") as! ItemHeaderTableViewCell
        v.delegate = self
        v.section = section
        v.personNameLabel.text = "\(people[section].fullName)"
        
        return v
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = ItemHeaderTableViewCell().frame.height
        return height
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "\(people[section].firstName)'s Items: \(people[section].items.count)"
        people[section].calcTotal()
        return "\(people[section].firstName)'s Items: \(people[section].items.count) for a total of $\(String(format: "%.2f",people[section].totalPrice))"
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let addItemView = AddEditItemViewController()
        addItemView.delegate = self
        addItemView.section = indexPath.section
        addItemView.itemNo = indexPath.row
        addItemView.edit = true
        
        addItemView.oldItem = people[indexPath.section].items[indexPath.row]
        
        self.presentViewController(addItemView, animated: false, completion: nil)
    }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemTableViewCell
//        
//        cell.itemName.text = people[indexPath.section].items[indexPath.row].name
//        cell.quantityLabel.text = "\(people[indexPath.section].items[indexPath.row].quantity)"
//        
//        if(indexPath.row == (people[indexPath.section].items.count - 1)){
//            let newSubtotal = people[indexPath.section].calcTotal()
//            people[indexPath.section].items[indexPath.row].price = newSubtotal
//            cell.quantityLabel.hidden = true
//        }
//        
//        cell.priceLabel.text = "$\(people[indexPath.section].items[indexPath.row].price)"
//        
//        return cell
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemTableViewCell
        
        cell.itemName.text = people[indexPath.section].items[indexPath.row].name
        cell.quantityLabel.text = "\(people[indexPath.section].items[indexPath.row].quantity)"
        cell.priceLabel.text = "$\(String(format: "%.2f", people[indexPath.section].items[indexPath.row].price))"
        
        return cell
    }
    
    func newItem(s: Int) {
        let addItemView = AddEditItemViewController()
        addItemView.delegate = self
        addItemView.section = s
        
        self.presentViewController(addItemView, animated: false, completion: nil)
    }
    
    func addItem(i: Item, s: Int) {
        people[s].items.insert(i, atIndex: 0)
        peopleTableView.reloadData()
    }
    
    func updateItem(item: Item, sect: Int, row: Int) {
        people[sect].items[row] = item
        peopleTableView.reloadData()
    }

}
