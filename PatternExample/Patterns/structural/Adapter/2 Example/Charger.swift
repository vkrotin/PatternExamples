//
//  Charger.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


//MARK: Base class

class Charger {
    func charge() {
        print("Yeee I am charging")
        
    }
}


//MARK: Generate class

protocol EuropeanNotebookChargerDelegate {
    func chargetNotebookRoundHoles(_ charger: Charger)
}

class EuropeanNotebookCharger : Charger, EuropeanNotebookChargerDelegate {
    
    
    var delegate: EuropeanNotebookChargerDelegate?
    
    override func charge() {
        delegate?.chargetNotebookRoundHoles(self)
        super.charge()
    }
    
    
    func chargetNotebookRoundHoles(_ charger: Charger) {
        print("Charging with 220 and round holes!")
    }
    
}

class USANotebookCharger {
    
    func chargetNotebookRectHoles(_ charger: Charger) {
        print("Charge Notebook Rect Holes")
    }
    
}
