//
//  ViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/19/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddPersonTVDelegate, AddContactDelegate {

// MARK - Outlets
    @IBOutlet weak var contactTableView: UITableView!
    
// MARK - Variables
    var peopleOnBill = [Person]()
    var names = [String:Int]()
    
// MARK - View and System Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactTableView.registerNib(UINib(nibName: "AddPersonTableViewCell", bundle:nil), forCellReuseIdentifier: "AddCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK - My Functions
    func addValue(value: Int) {
        addContacts()
    }

    func addContacts(){
        let acVC = AddContactViewController()
        acVC.delegate = self
        self.presentViewController(acVC, animated: true, completion: nil)
    }
    
    func addToContacts(people: [Person]){
        for p in people{
            if names[p.fullName] == nil{
                peopleOnBill.append(p)
                names.updateValue(1, forKey: p.fullName)
            }
        }
        self.contactTableView.reloadData()
    }
    
//MARK - TableView functions
    
    //How many sections are in this tableView?
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //How many rows are in this section?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleOnBill.count
    }
    
    //What does the header for this section look like?
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let cell = AddPersonTableViewCell()
        let cell = contactTableView.dequeueReusableCellWithIdentifier("AddCell") as! AddPersonTableViewCell
        cell.delegate = self
        return cell
    }
    
    //How tall is the header?
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = AddPersonTableViewCell().frame.height
        return height
    }
    
    //What happens when you tap this cell?
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //code
    }
    
    //What does the cell look like
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = contactTableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath)
        c.textLabel?.text = "\(peopleOnBill[indexPath.row].fullName)"
        return c
    }
    
}

