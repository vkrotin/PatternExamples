//
//  AdapterTest.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class AdapterTest {

    let bird = Bird()
    let raven = Raven()
    lazy var ravenAdapter = RavenAdapter(raven)
    
    
    func makeTheBird(_ obj: BirdProtocol) {
        obj.fly()
        obj.sing()
    }
    
    func test() {
        
        makeTheBird(bird)
        makeTheBird(ravenAdapter)
    }
    
}
