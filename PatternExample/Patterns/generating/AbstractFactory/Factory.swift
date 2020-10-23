//
//  Factory.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

protocol Factory {
    func getIphone() -> GenericIphone
    func getIpad() -> GenericIPad
}

class AppleFactory : Factory {
    func getIphone() -> GenericIphone {
        return AppleIphone()
    }
    
    func getIpad() -> GenericIPad {
        return AppleIpad()
    }
}

class FackeFactory : Factory {
    func getIphone() -> GenericIphone {
        return FackeIphone()
    }
    
    func getIpad() -> GenericIPad {
        return FackeIpad()
    }
}

