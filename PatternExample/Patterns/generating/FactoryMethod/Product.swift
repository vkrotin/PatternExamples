//
//  Product.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

protocol ProductMethods {
    func saveObject()
}

class Product : ProductMethods {
    
    let name: String = ""
    let price: Float = 0
    
    func saveObject() {
        print("I am saving an object in to product database")
    }
}

class Meat: Product {
    
    override func saveObject() {
        print("Saving object into Meat database")
    }
}

class Fish: Product {
    
    override func saveObject() {
        print("Saving object into Fish database")
    }
}


