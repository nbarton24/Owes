//
//  AddContactViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactsTable: UITableView!
    var contacts = ["Nick Barton","Not Nick"]
    
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
        
        cell.nameLabel.text = contacts[indexPath.row]
        cell.phoneLabel.text = "802-022-2234"
        
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
