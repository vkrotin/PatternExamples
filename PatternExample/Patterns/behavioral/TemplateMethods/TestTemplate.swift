//
//  TestTemplate.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class TestTemplate {
    
    let iphone = iPhoneMaker()
    let android = AndroidMaker()
    
    func test() {
        iphone.makePhone()
        android.makePhone()
    }
    
}
