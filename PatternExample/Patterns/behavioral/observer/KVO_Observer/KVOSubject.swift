//
//  KVOSubject.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class KVOSubject : NSObject {
    var changeableProperty: String = ""
}


class KVOObserver : NSObject {
    func observeValue(forKeyPath keyPath: String, of object: Any?, change: [String : Any]?, context: UnsafeMutableRawPointer?) {
        print("KVO: Value changed;")
    }
}

// ----------------------------
//
// KVO Test
//
// -----------------------------

class KVOTest {
    
    let subject = KVOSubject()
    let observer = KVOObserver()
    
    
    func test() {
        
        let nameProperty = "changeableProperty"
        subject.addObserver(observer, forKeyPath: nameProperty, options: .new, context: nil)
        subject.setValue("new value", forKey: nameProperty)
        #warning("because kvoSubj will be deallocated after this functions ends we need to remove observer information.")
        subject.removeObserver(observer, forKeyPath: nameProperty) 
    }
    
    
    
}
