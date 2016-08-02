//
//  AddEditItemViewController.swift
//  WhoOweMe
//
//  Created by Nick Barton on 8/1/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

protocol AddEditItemDelegate {
    func addItem(i: Item)
}

class AddEditItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
