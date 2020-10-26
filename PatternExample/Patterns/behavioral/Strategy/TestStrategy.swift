//
//  TestStrategy.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class TestStrategy {
    
    let player = Player()
    let atack = AttackStrategy()
    let defence = DefinesStrategy()
    
    func test() {
        
        player.change(atack)
        player.makeAction()
        player.change(defence)
        player.makeAction()
    }
}
