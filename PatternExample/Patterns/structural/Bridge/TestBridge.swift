//
//  TestBridge.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class TestBridge {
    
    let player = MusicPlayer()
    let ch = CheapHeadphones()
    let ep = ExpensiveHeadphones()
    
    func test() {
        
        player.headPhones = ch
        player.play()
        
        player.headPhones = ep
        player.play()
        
    }
    
}
