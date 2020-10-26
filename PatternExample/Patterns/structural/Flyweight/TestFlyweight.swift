//
//  TestFlyweight.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class TestFlyweight {
    
    var units:[BaseUnit] = []
    
    func test() {
        
        for _ in 1...500 {
            units.append(Dragon.dragon())
        }
        
        for _ in 1...500 {
            units.append(Goblin.goblin())
        }
        
    }
    
}
