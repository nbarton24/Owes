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

    @IBOutlet weak var contactTableView: UITableView!
    
    var vals = [2,3]
    var peopleOnBill = [Person]()
    var names = [String:Int]()
    
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
        return peopleOnBill.count
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
        
        c.textLabel?.text = "Hello \(peopleOnBill[indexPath.row].name)"
        
        return c
    }
    
    func addContacts(){
        print("Adding contacts")
        let acVC = AddContactViewController()
        acVC.delegate = self
        self.presentViewController(acVC, animated: true, completion: nil)
    }
    
    func addToContacts(people: [Person]){
        for p in people{
            //print("You added \(p.name)")
            
            if names[p.name] != nil{
                print("\(p.name) already exists")
            }else{
                peopleOnBill.append(p)
                names.updateValue(1, forKey: p.name)
            }
        }
        self.contactTableView.reloadData()
    }
    
    
}

