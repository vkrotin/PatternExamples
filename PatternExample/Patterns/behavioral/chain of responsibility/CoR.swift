//
//  CoR.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

//
// Model declaration
//

class BaseItem {}
class Toy : BaseItem {}
class Electronic: BaseItem {}
class Trash: BaseItem {}

//
// Handler
//

class BaseHandler {
    var nextHandler : BaseHandler?
    
    func handle(_ item: BaseItem) {
    }
}

class ToysHandler: BaseHandler {
    
    override func handle(_ item: BaseItem) {
        if  item is Toy {
            print("Toy found. Handling")
        } else {
            print("Toy not found. Handling using next handler")
            nextHandler?.handle(item)
        }
    }
}

class ElectronicsHandler: BaseHandler {
    
    override func handle(_ item: BaseItem) {
        if  item is Electronic {
            print("Electronics found. Handling")
        } else {
            print("Electronics not found. Handling using next handler")
            nextHandler?.handle(item)
        }
    }
}

class OtherItemsHandler: BaseHandler {
    
    override func handle(_ item: BaseItem) {
        print("Found undefined item. Destroying")
    }
}
