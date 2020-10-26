//
//  PhoneTemplate.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

//MARK: Template class

class AnyPhoneTemplate {
    
    func makePhone() {
        takeBox()
        takeCamera()
        takeMicrophone()
        assamle()
    }
    
    func takeBox() {
        print("Taking a box")
    }
    
    func takeMicrophone() {
        print("Taking a microphone")
    }
    
    func takeCamera() {
        print("Taking a camera")
    }
    
    func assamle() {
        print("Assembling everything")
    }
}

//MARK: Use Template methods

class iPhoneMaker: AnyPhoneTemplate {
    
    func design() {
        print("Putting label 'Designed in California'")
    }
    
    override func takeBox() {
        design()
        super.takeBox()
    }
}

class AndroidMaker : AnyPhoneTemplate {
    
    func addRam() {
        print("Installing 128 GB of RAM")
    }
    
    func addCPU() {
        print("Installing 16 more CPUs")
    }
    
    
    override func assamle() {
        addCPU()
        addRam()
        super.assamle()
    }
}
