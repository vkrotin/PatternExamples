//
//  CorTest.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class CoRTest {
    
    let toysH = ToysHandler()
    let electronicsH = ElectronicsHandler()
    let otherItemsH = OtherItemsHandler()
    
    let toy = Toy()
    let electrinic = Electronic()
    let trash = Trash()
    
    func test() {
        declaration()
        
        toysH.handle(toy)
        toysH.handle(electrinic)
        toysH.handle(trash)
    }
    
    private func declaration() {
        
        electronicsH.nextHandler = otherItemsH
        toysH.nextHandler = electronicsH
    }
}
