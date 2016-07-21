//
//  Item.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class Item {
    
    var itemName:String?
    var itemPrice:Double?
    
    
    init(){
        self.itemName = "Food"
        self.itemPrice = 5.44
    }
    init(item: String, price: Double){
        
        self.itemName = item
        self.itemPrice = price
        
    }

}