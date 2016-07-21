//
//  Person.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class Person {
    
    private var _firstName:String
    private var _lastName:String
    var phoneNums = [PhoneNumber]()
    var items = [Item]()
    var selected = false
    
    init(){
        self._firstName = "No"
        self._lastName = "Name"
    }
    
    init(fName:String,lName:String){
        self._firstName = fName
        self._lastName = lName
    }
    
    var name:String {
        return "\(_firstName) \(_lastName)"
    }
    
}