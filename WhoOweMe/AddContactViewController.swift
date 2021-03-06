//
//  AddContactViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit
import ContactsUI

protocol AddContactDelegate {
    func addToContacts(people: [Person])
}

class AddContactViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
// MARK - Outlets
    @IBOutlet weak var contactsTable: UITableView!
    
// MARK - Variables
    var delegate: AddContactDelegate?
    var CM = ContactManager()
    var ppl = [Person]()
    var peopleSelected = [Person]()
    
// MARK - System Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ppl.appendContentsOf(CM.loadContacts())
        contactsTable.registerNib(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "Contact")
        
    }
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// MARK - TableView Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ppl.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = contactsTable.dequeueReusableCellWithIdentifier("Contact", forIndexPath: indexPath) as! ContactTableViewCell
        
        //This currently only handles when phone numbers are 10 digits
        cell.person = ppl[indexPath.row]
        cell.nameLabel.text = ppl[indexPath.row].fullName
        //ppl[indexPath.row].selected = true
        if ppl[indexPath.row].selected { cell.backgroundColor = UIColor.greenColor()} else {cell.backgroundColor = UIColor.whiteColor()}
        if ppl[indexPath.row].phoneNums.count != 0 {
            cell.phoneLabel.text = "\(ppl[indexPath.row].phoneNums[0].formattedValue)"
        }
        
        return cell
    }
    
// MARK - UI Response Actions
    
    //Done button selected.
    @IBAction func returnContacts(sender: AnyObject) {
        for contact in ppl{
            if contact.selected == true {
                peopleSelected.append(contact)
            }
        }
        delegate?.addToContacts(peopleSelected)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
