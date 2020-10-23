//
//  CentrallProcessor.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class CentrallProcessor {
    var thermometr: Thermometr?
    var condSystem: ConditioningSystem?
    
    func valueChanged(_ aPart: SmartHusePart) {
        print("Value changed! We need to do smth!")
        
        if aPart is Thermometr {
           print("Oh, the change is temperature")
            condSystem?.startCondition()
        }
    }
}


class Thermometr : SmartHusePart {
    
    var temperature: Int = 25 {
        didSet {
           numbersChanged()
        }
    }
}

class ConditioningSystem : SmartHusePart {
    
    func startCondition() {
        print("Conditioning...")
    }
}
