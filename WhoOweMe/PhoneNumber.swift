//
//  PhoneNumber.swift
//  WhoOweMe
//
//  Created by Nick Barton on 7/21/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import Foundation

class PhoneNumber {
    
    private var _type:String
    private var _num:String
    
    init(){
        self._num = "8888888888"
        self._type = "Home"
    }
    init(tp:String, num:String){
        self._num = num
        self._type = tp
    }
    
    var formattedValue:String {
        get {
            switch Int((_num.characters.count)){
                //Standard US Phone
                case 10:
                    let first = _num.substringWithRange(_num.startIndex..<_num.startIndex.advancedBy(3))
                    let mid = _num.substringWithRange(_num.startIndex.advancedBy(3)..<_num.startIndex.advancedBy(6))
                    let last = _num.substringWithRange(_num.startIndex.advancedBy(6)..<_num.startIndex.advancedBy(10))
                    return "(\(first))-\(mid)-\(last)"
                //Standard US Phone with Country Code
                case 11:
                    let first = _num.substringWithRange(_num.startIndex.advancedBy(1)..<_num.startIndex.advancedBy(4))
                    let mid = _num.substringWithRange(_num.startIndex.advancedBy(4)..<_num.startIndex.advancedBy(7))
                    let last = _num.substringWithRange(_num.startIndex.advancedBy(7)..<_num.startIndex.advancedBy(11))
                    return "(\(first))-\(mid)-\(last)"
                //No Area Code
                case 7:
                    let first = _num.substringWithRange(_num.startIndex..<_num.startIndex.advancedBy(3))
                    let last = _num.substringWithRange(_num.startIndex.advancedBy(3)..<_num.startIndex.advancedBy(7))
                    return "\(first)-\(last)"
                default:
                    return "Invalid Phone"
            }
        }
    }
    
    
}