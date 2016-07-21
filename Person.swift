//
//  Person.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class Person {
    
    private var _firstName:String?
    private var _lastName:String?
    private var _phoneNums = [PhoneNumber]()
    
    init(){
        self._firstName = "No"
        self._lastName = "Name"
    }
    
    init(fName:String,lName:String){
        self._firstName = fName
        self._lastName = lName
    }
    
}