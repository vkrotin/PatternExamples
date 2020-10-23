//
//  TestNoute.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class TestNoute {
    
    let euroAdapter = EuropeanNotebookCharger()
    let usaCharger = USANotebookCharger()
    
    
    func makeTheNotebookCharge(_ charger: Charger) {
        charger.charge()
    }
    
    func test()  {
        let adapter = USANotebookEuropeanAdapter(usaCharger)
        makeTheNotebookCharge(adapter)
    }
    
    
}
