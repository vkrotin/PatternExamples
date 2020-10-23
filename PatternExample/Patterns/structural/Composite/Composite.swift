//
//  Composite.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


protocol CompositObjectProtocol {
    func getData() -> String
    func add(_ component: CompositObjectProtocol)
}

class LeafObject : CompositObjectProtocol {
    
    let leafValue: String
    
    init(_ leaf: String) {
        leafValue = leaf
    }
    
    
    func getData() -> String {
        return "<\(leafValue)>"
    }
    
    func add(_ component: CompositObjectProtocol) {
        print("Can't add component. Sorry, man")
    }
}

class Container : CompositObjectProtocol {
    
    var components: [CompositObjectProtocol] = []
    
    func getData() -> String {
        
        let valueToReturn: NSMutableString = ""
        valueToReturn.append("<ContainerValues>")
        
        for obj in components {
            valueToReturn.append(obj.getData())
        }
        valueToReturn.append("</ContainerValues>")
         
        return valueToReturn as String
    }
    
    func add(_ component: CompositObjectProtocol) {
        components.append(component)
    }
}


// ----------------------------
//
// Composite Test
//
// -----------------------------


class CompositeTest {
    
    let rootContainer = Container()
    
    func test() {
        
        rootContainer.add(LeafObject("Level 1 value"))
        
        let firstLevelContainer = Container()
        firstLevelContainer.add(LeafObject("Level 2 value"))
        rootContainer.add(firstLevelContainer)
        
        let firstLevelContainer2 = Container()
        firstLevelContainer2.add(LeafObject("Lever 2 value 2"))
        rootContainer.add(firstLevelContainer2)
        
        print("\(rootContainer.getData())")
        
    }
    
}
