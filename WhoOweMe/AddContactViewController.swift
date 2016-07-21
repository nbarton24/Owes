//
//  AddContactViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit
import ContactsUI

class AddContactViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactsTable: UITableView!
    lazy var contacts: [CNContact] = {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName),
            CNContactPhoneNumbersKey]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containersMatchingPredicate(nil)
        } catch {
            print("Error fetching containers")
        }
        
        var results: [CNContact] = []
        
        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainerWithIdentifier(container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContactsMatchingPredicate(fetchPredicate, keysToFetch: keysToFetch)
                results.appendContentsOf(containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        
        return results
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTable.registerNib(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "Contact")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = contactsTable.dequeueReusableCellWithIdentifier("Contact", forIndexPath: indexPath) as! ContactTableViewCell
        
        //This currently only handles when phone numbers are 10 digits
        cell.nameLabel.text = "\(contacts[indexPath.row].givenName) \(contacts[indexPath.row].familyName)"
        let number = String((contacts[indexPath.row].phoneNumbers[0].value as! CNPhoneNumber).valueForKey("digits")!)
        //let type :String  =  CNLabeledValue.localizedStringForLabel(contacts[indexPath.row].phoneNumbers[0].label)
        let first3 = number.substringWithRange(Range(number.startIndex..<number.startIndex.advancedBy(3)))
        let next3 = number.substringWithRange(Range(number.startIndex.advancedBy(3)..<number.startIndex.advancedBy(6)))
        let last4 = number.substringWithRange(Range(number.startIndex.advancedBy(6)..<number.startIndex.advancedBy(10)))
        cell.phoneLabel.text = "(\(first3))-\(next3)-\(last4)"
        
        return cell
    }
    
    @IBAction func returnContacts(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
