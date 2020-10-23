//
//  PhoneBuilder.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

protocol AndroidPhoneMethods {
    
    func getPhone() -> AndroidPhone
    
    func setOSVersion()
    func setName()
    func setCPUCodeName()
    func setRAMSize()
    func setOSVersionCode()
    func setLauncher()
    
    
}

class AndroidPhoneBuilder : AndroidPhoneMethods  {
    
    func getPhone() -> AndroidPhone {
        return phone
    }
    
    func setOSVersion() {
    }
    
    func setName() {
    }
    
    func setCPUCodeName() {
    }
    
    func setRAMSize() {
    }
    
    func setOSVersionCode() {
    }
    
    func setLauncher() {
    }
    
    var phone = AndroidPhone()
}

class LowPricePhoneBuilder: AndroidPhoneBuilder {
    
    override func setOSVersion() {
        phone.osVersion = "Android `10.2"
    }
    
    override func setName() {
        phone.name = "Low price phone!"
    }
    
    override func setCPUCodeName() {
        phone.cpuCodeName = "Some low CPU"
    }
    
    override func setRAMSize() {
        phone.RAMsize = 256
    }
    
    override func setOSVersionCode() {
        phone.osVersionCode = 5.221
    }
    
    override func setLauncher() {
        phone.launcher = "Hia Tsung!"
    }
}

class HightPricePhoneBuilder: AndroidPhoneBuilder {
    
    override func setOSVersion() {
        phone.osVersion = "Android `14"
    }
    
    override func setName() {
        phone.name = "Hight price phone!"
    }
    
    override func setCPUCodeName() {
        phone.cpuCodeName = "Some expensive CPU"
    }
    
    override func setRAMSize() {
        phone.RAMsize = 16624
    }
    
    override func setOSVersionCode() {
        phone.osVersionCode = 10.221
    }
    
    override func setLauncher() {
        phone.launcher = "Samsung Launcher"
    }
}

