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
    
// MARK - Variables
    
    private var _itemName:String
    var price:Double
    private var _currency = Currency.USD
    var quantity = 1
    var totalPrice = 0.00
    
    init(){
        self._itemName = "Food"
        self.price = 5.44
    }
    init(item: String, price: Double){
        
        self._itemName = item
        self.price = price
        self.totalPrice = price
        
    }
    
    init(item: String, price: Double, qty: Int){
        
        self._itemName = item
        self.price = price
        self.quantity =  qty
        self.calculateTotalPrice()
        
    }
    
// MARK - Computed Variables
    var name:String{
        get{
            return _itemName
        }
        set{
            _itemName = name
        }
    }
    
//    var price:Double {
//        
//        get{
//           return _itemPrice
//        }
//        set{
//            print("setting new price - \(price)")
//            if price >= 0 { _itemPrice = price }
//        }
//    }
//    
    func calculateTotalPrice(){
        self.totalPrice = self.price * Double(self.quantity)
    }
    
    //Will need to test this -- Also needed is handling trailing zero when item price is like $xx.x0, as Doubles will drop trailing 0
    var formattedPrice:String {
        get{
            return "\(_currency.rawValue)\(price)"
        }
    }

}