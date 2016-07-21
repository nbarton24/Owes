//
//  PhoneNumber.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class PhoneNumber {
    
    private var _type:String?
    private var _num:Int?
    
    init(){
        self._num = 8888888888
        self._type = "Home"
    }
    init(tp:String, num:Int){
        self._num = num
        self._type = tp
    }
    
    
}