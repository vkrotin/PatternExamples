//
//  Enumerator.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class BaseEnumerator: NSEnumerator {
    
    init(_ items:[Any]) {
        super.init()
    }
}

class BadItemsEnumerator: BaseEnumerator {
    
    private let items = NSMutableArray()
    private lazy var internalEnumerator: NSEnumerator = items.objectEnumerator()
    
    override init(_ items: [Any]) {
        super.init(items)
        
        guard let items = items as? [ItemInShop] else {
            return
        }
          
        for item in items {
            if item.isBroken {
                self.items.add(item)
            }
        }
    }
    
    override var allObjects: [Any] {
        return items as! [Any]
    }
    
    override func nextObject() -> Any? {
        return internalEnumerator.nextObject()
    }
}

class GoodItemsEnumerator: BaseEnumerator {
    
    private let items = NSMutableArray()
    private lazy var internalEnumerator: NSEnumerator = items.objectEnumerator()
    
    override init(_ items: [Any]) {
        super.init(items)
        
        guard let items = items as? [ItemInShop] else {
            return
        }
          
        for item in items {
            if item.isBroken == false {
                self.items.add(item)
            }
        }
    }
    
    override var allObjects: [Any] {
        return items as! [Any]
    }
    
    override func nextObject() -> Any? {
        return internalEnumerator.nextObject()
    }
}
