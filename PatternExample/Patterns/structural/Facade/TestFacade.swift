//
//  TestFacade.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class TestFacade {
    
    let facade = TravellSystemFacade()
    
    func test() {
        facade.travel(to: "Ragnorek")
    }
    
}
