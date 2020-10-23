//
//  TestMediator.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class TestMediator {
    
    let proccessor = CentrallProcessor()
    lazy var therm = Thermometr(proccessor)
    lazy var condSystem = ConditioningSystem(proccessor)
    
    
    func test()  {
        proccessor.condSystem = condSystem
        proccessor.thermometr = therm
        therm.temperature = 45
        
    }
    
}
