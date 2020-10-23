//
//  TestObserver.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class TestObserver {
    
    let subj = StandardSubjectImplementation()
    let someSubscriber = SomeSubscriber()
    let otherSubscriber = OtherSubscriber()
    
    func test() {
        subj.add(observer: someSubscriber)
        subj.add(observer: otherSubscriber)
        
        
        subj.change(value: "some value change", new: "new value")
    }
    
}
