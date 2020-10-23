//
//  Model.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class GenericIphone {
    let osName: String
    let productName: String
    
    init(_ name: String, _ product: String) {
        osName = name
        productName = product
    }
}

class GenericIPad {
    let osName: String
    let productName: String
    let screenSize: Float = 8.5
    
        
    init(_ name: String, _ product: String) {
        osName = name
        productName = product
    }
}
