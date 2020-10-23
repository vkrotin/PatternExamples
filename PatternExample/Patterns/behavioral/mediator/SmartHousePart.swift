//
//  SmartHousePart.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class SmartHusePart {
    
    private let processor : CentrallProcessor
    
    init(_ processor: CentrallProcessor) {
        self.processor = processor
    }
    
    func numbersChanged() {
        processor.valueChanged(self)
    }
    
}
