//
//  Bird.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

protocol BirdProtocol {
    func sing()
    func fly()
}

class Bird : BirdProtocol {
    func sing() {
        print("Tew-tew-tew")
    }
    
    func fly() {
        print("OMG! I am flying!")
    }
}

class Raven {
    
    func flySearchAndDestroy() {
        print("I am flying and seak for killing!")
    }
    
    func voice() {
        print("Kaar-kaaar-kaaaaar")
    }
}

class RavenAdapter: BirdProtocol {

    private let raven: Raven
    
    init(_ raven: Raven) {
        self.raven = raven
    }
    
    func sing() {
        raven.voice()
    }
    
    func fly() {
        raven.flySearchAndDestroy()
    }
    
}

