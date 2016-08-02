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
        self.peopleTableView.registerNib(UINib(nibName: "ItemHeaderTableViewCell", bundle:nil), forCellReuseIdentifier: "PersonHeader")
        print("You're splitting this bill between:")
        for p in people {
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
        return 1
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let v = peopleTableView.dequeueReusableCellWithIdentifier("PersonHeader") as! ItemHeaderTableViewCell
//        v.personNameLabel.text = "Hello"
//        
//        return v
//    }
    
//    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Done"
//    }

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return people[section].fullName
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello \(people[indexPath.section].firstName)"
        
        return cell
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
