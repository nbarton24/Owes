//
//  Person.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class Person {
    
// MARK - Variables
    private var _firstName:String
    private var _lastName:String
    
    var phoneNums = [PhoneNumber]()
    
    var items = [Item]()
    var totalPrice = 0.0
    private var _tax = Item(item: "Tax", price: 0.0)
    //private var _subTotal = Item(item: "Subtotal", price: 10.0)
    
    var selected = false
    
// MARK - Initializers
    init(){
        self._firstName = "No"
        self._lastName = "Name"
        //let subTotal = Item(item: "Subtotal", price: 10.0)
        //self.items.append(subTotal)
    }
    
    init(fName:String,lName:String){
        self._firstName = fName
        self._lastName = lName
        //let subTotal = Item(item: "Subtotal", price: 10.0)
        //self.items.append(subTotal)
    }
    
// MARK - Computed Variables
    var fullName:String {
        return "\(_firstName) \(_lastName)"
    }
    
    var firstName:String{
        get{
            return _firstName
        }
        set{
            if firstName != "" { _firstName = firstName }
        }
    }
    
    var lastName:String{
        get{
            return _lastName
        }
        set{
            if lastName != "" { _lastName = lastName }
        }
    }
    
// MARK - Functions
//    func calcTotal() -> Double {
//        var sum = 0.0
//        let itemCount = items.count
//        if itemCount == 1 {
//            return 0.0
//        }else{
//            for i in 0 ..< itemCount-1 {
//                sum += items[i].price
//            }
//        }
//        
//        return sum
//    }
    
    func calcTotal(){
        var sum = 0.0
        for i in items {
            sum += (i.price) * Double(i.quantity)
        }
        totalPrice = sum
    }
    
}