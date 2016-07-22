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
    
    //Will do more here with hiding items when I get to that point.
    //Still need to decide how to handle tax and tip
    var items = [Item]()
    private var _total = 0.0
    private var _tax = Item(item: "Tax", price: 0.0)
    private var _subTotal = Item(item: "Subtotal", price: 0.0)
    
    var selected = false
    
// MARK - Initializers
    init(){
        self._firstName = "No"
        self._lastName = "Name"
    }
    
    init(fName:String,lName:String){
        self._firstName = fName
        self._lastName = lName
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
    func calcTotal() -> Double {
        
        return 0
    }
    
}