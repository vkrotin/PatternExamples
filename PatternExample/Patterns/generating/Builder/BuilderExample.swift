//
//  BuilderExample.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class BuilderExample {
    
    let cheepBuilder = LowPricePhoneBuilder()
    let hightBuilder = HightPricePhoneBuilder()
    let salesMan = FactorySalesMan()
    
    func example() {
        salesMan.set(builder: cheepBuilder)
        print(salesMan.getPhone())
        
        salesMan.set(builder: hightBuilder)
        print(salesMan.getPhone())
        
    }
    
    
    
}
