//
//  PhoneNumber.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class PhoneNumber {
    
    var type:String?
    var num:String?
    
    init(){
        self.num = "8888888888"
        self.type = "Home"
    }
    init(tp:String, num:String){
        self.num = num
        self.type = tp
    }
    
    
}