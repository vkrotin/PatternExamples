//
//  ProductGenerator.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class ProductGenerator {
    
    func getProduct(_ price: Float) -> Product? {
        
        if price > 0 && price < 100 {
            return Fish()
        }
        else if price >= 100 {
            return Meat()
        } else {
            return nil
        }
    }
    
    func saveExpenses(_ price: Float) {
        let product = getProduct(price)
        product?.saveObject()
    }
}
