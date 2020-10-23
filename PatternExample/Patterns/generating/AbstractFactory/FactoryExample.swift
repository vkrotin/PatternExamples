//
//  FactoryExample.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class FactoryExample {
    
    var isThirdWorld = false
    
    func getFactory() -> Factory {
        if isThirdWorld {
            return FackeFactory()
        }
        return AppleFactory()
    }
    
    func example()  {
        isThirdWorld = false
        let factory = getFactory()
        let iPad = factory.getIpad()
        let iPhone = factory.getIphone()
        
        print("iPad named = \(iPad.productName), osName = \(iPad.osName), screenSize = \(iPad.screenSize)")
        print("iPhone named = \(iPhone.productName), osName = \(iPhone.osName)")
    }
    
}
