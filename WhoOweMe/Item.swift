//
//  Item.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

enum Currency:String{
    case USD = "$"
}

class Item {
    
    private var _itemName:String
    private var _itemPrice:Double
    private var _currency = Currency.USD
    
    init(){
        self._itemName = "Food"
        self._itemPrice = 5.44
    }
    init(item: String, price: Double){
        
        self._itemName = item
        self._itemPrice = price
        
    }
    
    var name:String{
        get{
            return _itemName
        }
        set{
            _itemName = name
        }
    }
    
    var price:Double {
        get{
           return _itemPrice
        }
        set{
            if price >= 0 { _itemPrice = price }
        }
    }
    
    //Will need to test this -- Also needed is handling trailing zero when item price is like $xx.x0, as Doubles will drop trailing 0
    var formattedPrice:String {
        get{
            return "\(_currency.rawValue)\(_itemPrice)"
        }
    }

}