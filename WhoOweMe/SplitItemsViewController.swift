//
//  SplitItemsViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/22/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class SplitItemsViewController: UIViewController {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("You're splitting this bill between:")
        for p in people {
            print(" -\(p.fullName)")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
