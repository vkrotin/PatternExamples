//
//  Iterator.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class ItemInShop {
    
    let name: String
    let isBroken: Bool
    
    init(_ name: String, _ isBroken: Bool = false) {
        self.name = name
        self.isBroken = isBroken
    }
}

class ShopWharehouse {
    
    private var goods:[ItemInShop] = []
    
    func add(item: ItemInShop) {
        goods.append(item)
    }
    
    func getBrokenItemsEnumerator() -> NSEnumerator {
        return BadItemsEnumerator(goods)
    }
    
    func getGoodItemsEnumerator() -> NSEnumerator {
        return GoodItemsEnumerator(goods)
    }
}

// ----------------------------
//
// Iterator Test
//
// -----------------------------


class IteratorTest {
    
    let shopWharehouse = ShopWharehouse()
    lazy var goodIterator = shopWharehouse.getBrokenItemsEnumerator()
    
    func test() {
        shopWharehouse.add(item: ItemInShop("Item1"))
        shopWharehouse.add(item: ItemInShop("Item2", true))
        shopWharehouse.add(item: ItemInShop("Item3"))
        shopWharehouse.add(item: ItemInShop("Item4", true))
        shopWharehouse.add(item: ItemInShop("Item5"))
       
        while let item = shopWharehouse.getGoodItemsEnumerator().nextObject() {
            guard let item = item as? ItemInShop else {
                continue
            }
            print("Good Item = \(item.name)")
        }
        
        while let item = shopWharehouse.getBrokenItemsEnumerator().nextObject() {
            guard let item = item as? ItemInShop else {
                continue
            }
            print("Bad Item = \(item.name)")
        }
    }
    
}
