//
//  StandartOserver.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

protocol StandartObserver {
    
    func valueChanged(_ oldValue: String, _ value: String)
    
}

protocol StandartSubject {
    
    func add(observer: StandartObserver)
    func remove(observer: StandartObserver)
    func notifyObjects()
    
}


class StandardSubjectImplementation : StandartSubject {
    
    private var valueName: String = ""
    private var newValue: String = ""
    
    let observerCollection = NSMutableSet()
    
    
    func add(observer: StandartObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: StandartObserver) {
        observerCollection.remove(observer)
    }
    
    func notifyObjects() {
        
        for observer in observerCollection {
            if let observer = observer as? StandartObserver {
                observer.valueChanged(valueName, newValue)
            }
        }
    }
    
    func change(value valueName: String, new value: String) {
        self.valueName = valueName
        self.newValue = value
        notifyObjects()
    }
    
}
