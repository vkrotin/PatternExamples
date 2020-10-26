//
//  Memento.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


struct OrganizationState {
    var intValue: Int
    var stringValue: String
    
    init(_ iValue: Int, _ sValue: String) {
        self.intValue = iValue
        self.stringValue = sValue
    }
}

class Originator {
    
    private var localState = OrganizationState(100, "Some test string")
    
    func changeValues() {
        localState.intValue += 1
        localState.stringValue = "\(localState.stringValue) !"
        print("Current state int = \(localState.intValue), string = \(localState.stringValue)")
    }
    
    
    func get() -> OrganizationState {
        return localState
    }
    
    func set(_ state: OrganizationState) {
        localState = state
        print("Load completed. Current state: int = \(localState.intValue), string = \(localState.stringValue)")
    }
    
}

class Memento {
    private let localState: OrganizationState
    
    init(with state: OrganizationState) {
        self.localState = state
    }
    
    func getState() -> OrganizationState {
        return localState
    }
}


class Caretaker {
    
    private var organizator: Originator = Originator()
    private var memento: Memento?
    
    
    func changeValue() {
        organizator.changeValues()
    }
    
    func saveState() {
        memento = Memento(with: organizator.get())
        
        guard let state = memento?.getState() else {
            return
        }
        print("Saved state. State int = \(state.intValue) and string = \(state.stringValue)")
    }
    
    func loadState() {
        guard let state = memento?.getState() else {
            return
        }
        organizator.set(state)
    }
}

class testMemento {
    
    let careteker = Caretaker()
    
    func test() {
        careteker.changeValue()
        careteker.saveState()
        careteker.changeValue()
        careteker.changeValue()
        careteker.changeValue()
        careteker.loadState()
    }
    
}
