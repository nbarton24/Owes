//
//  SplitItemsViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/22/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class SplitItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var people = [Person]()
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.peopleTableView.registerNib(UINib(nibName: "ItemTableViewCell",bundle: nil), forCellReuseIdentifier: "ItemCell")
        self.peopleTableView.registerNib(UINib(nibName: "ItemHeaderTableViewCell", bundle:nil), forCellReuseIdentifier: "PersonHeader")
        self.peopleTableView.backgroundColor = UIColor.clearColor()
        print("You're splitting this bill between:")
        let i = Item(item: "Temp", price: 8.99)
        for p in people {
            p.items.insert(i, atIndex: 0)
            print(" -\(p.fullName)")
        }
        
        //peopleTableView.scrollEnabled = false
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
        v.personNameLabel.text = "\(people[section].fullName)"
        
        return v
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = ItemHeaderTableViewCell().frame.height
        return height
    }
    
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let v = peopleTableView.dequeueReusableCellWithIdentifier("PersonHeader") as! ItemHeaderTableViewCell
//        v.backgroundColor = UIColor.blueColor()
//        v.personNameLabel.text = "Hello"
//        
//        return v
//    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Items: \(people[section].items.count)"
    }

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "\(people[indexPath.section].items[indexPath.row].name)"

        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemTableViewCell
        
        cell.itemName.text = people[indexPath.section].items[indexPath.row].name
        
        if(indexPath.row == (people[indexPath.section].items.count - 1)){
            cell.contentView.backgroundColor = UIColor.brownColor()
            cell.itemName?.textColor = UIColor.whiteColor()
            let newSubtotal = people[indexPath.section].calcTotal()
            print("New Subtotal: \(newSubtotal)")
            print("For index: \(indexPath.row)")
            people[indexPath.section].items[indexPath.row].price = 12.00
        }
//        
//        for i in people[indexPath.section].items{
//            print("\(i.name) - \(i.price)")
//        }
        
        cell.priceLabel.text = "$\(people[indexPath.section].items[indexPath.row].price)"
        return cell
    }

}
