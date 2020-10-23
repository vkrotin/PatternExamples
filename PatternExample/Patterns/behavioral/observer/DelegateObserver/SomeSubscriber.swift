//
//  SomeSubscriber.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class SomeSubscriber {
    // define method in class
}

extension SomeSubscriber : StandartObserver {
    func valueChanged(_ oldValue: String, _ value: String) {
        print("And some subscriber tells: Hmm, value \(oldValue) changed to \(value)")
    }
}
// ------------------------------------------------

class OtherSubscriber {
    // define method in class
}

extension OtherSubscriber : StandartObserver {
    func valueChanged(_ oldValue: String, _ value: String) {
        print("And some OTHER subscriber tells: Hmm, value \(oldValue) changed to \(value)")
    }
}
