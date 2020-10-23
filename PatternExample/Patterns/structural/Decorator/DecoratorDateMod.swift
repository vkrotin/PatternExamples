//
//  DecoratorDateMod.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


extension Date {
    
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        return dateFormatter.string(from: self)
    }
    
    func toString(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}


// ----------------------------
//
// Decorator Test
//
// -----------------------------

class DecoratorTest {
    
    func test() {
        let date = Date()
        
        let string = date.toString
        let someFormatString = date.toString(with: "dd.MM.yyyy HH:mm:ss")
        
        print("Date is: \(string)")
        print("Date with other format: \(someFormatString)")
    }
    
}
