//
//  ViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/19/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddPersonTVDelegate {

    @IBOutlet weak var contactTableView: UITableView!
    
    var vals = [2,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactTableView.registerNib(UINib(nibName: "AddPersonTableViewCell", bundle:nil), forCellReuseIdentifier: "AddCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addValue(value: Int) {
        addContacts()
        //vals.append(value)
        //print("\(vals.count)")
        //self.contactTableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vals.count
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let cell = AddPersonTableViewCell()
        let cell = contactTableView.dequeueReusableCellWithIdentifier("AddCell") as! AddPersonTableViewCell
        cell.delegate = self
        return cell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = AddPersonTableViewCell().frame.height
        return height
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //code
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = contactTableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath)
        
        c.textLabel?.text = "Hello \(vals[indexPath.row])"
        
        return c
    }
    
    func addContacts(){
        print("Adding contacts")
        let acVC = AddContactViewController()
        self.presentViewController(acVC, animated: true, completion: nil)
    }
    
    
}

