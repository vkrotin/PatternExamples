//
//  Visitor.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

// base model

struct WarehouseItem {
    let name: String
    let isBroken: Bool
    let price: Int
    
    init(_ name: String, _ price: Int, _ broken: Bool) {
        self.name = name
        self.price = price
        self.isBroken = broken
    }
}

class Warehouse {
    
    private var items:[WarehouseItem] = []
    
    func add(_ item: WarehouseItem) {
        items.append(item)
    }
    
    func accept(_ visitor: BaseVisitor) {
        visitor.visit(self)
        for item in items {
            visitor.visit(item)
        }
    }
    
}

protocol BaseVisitor {
    func visit(_ anObject: Any)
}


class QualityCheckerVisitor: BaseVisitor {
    
    func visit(_ anObject: Any) {
        
        if let anObject = anObject as? WarehouseItem {
            if anObject.isBroken {
                print("Item: \(anObject.name) is broken")
            } else {
                print("Item: \(anObject.name) is pretty cool!")
            }
        }
        
        if anObject is Warehouse {
            print("Hmm, nice warehouse!")
            return
        }
    }
    
    
}

class PriceCheckerVisitor : BaseVisitor {
    
    func visit(_ anObject: Any) {
        if let anObject = anObject as? WarehouseItem {
            if anObject.isBroken {
                print("Item: \(anObject.name) have a price: \(anObject.price)")
            } else {
                print("Item: \(anObject.name) is pretty cool!")
            }
        }
        
        if anObject is Warehouse {
            print("Hmmm, I don't know how much Warehouse costs!")
            return
        }
    }
    
    
}
