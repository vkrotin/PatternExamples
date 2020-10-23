//
//  USANotebookEuropeanAdapter.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class USANotebookEuropeanAdapter: Charger {
    
    private var usaCharger: USANotebookCharger?
    
    
    init(_ charger: USANotebookCharger) {
        self.usaCharger = charger
    }
    
    override func charge() {
        let euroCharge = EuropeanNotebookCharger()
        euroCharge.delegate = self
        euroCharge.charge()
        
    }
}

extension USANotebookEuropeanAdapter : EuropeanNotebookChargerDelegate {
    
    func chargetNotebookRoundHoles(_ charger: Charger) {
        self.usaCharger?.chargetNotebookRectHoles(charger)
    }

    
}
