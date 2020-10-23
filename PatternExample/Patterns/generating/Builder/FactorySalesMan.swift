//
//  FactorySalesMan.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class FactorySalesMan {
    private var builder: AndroidPhoneBuilder = AndroidPhoneBuilder()
    
    func set(builder: AndroidPhoneBuilder) {
        self.builder = builder
        constructPhone()
    }
    
    func getPhone() -> AndroidPhone {
        return builder.getPhone()
    }
    
    private func constructPhone() {
        builder.setOSVersion()
        builder.setName()
        builder.setCPUCodeName()
        builder.setRAMSize()
        builder.setOSVersion()
        builder.setLauncher()
    }
    
}
