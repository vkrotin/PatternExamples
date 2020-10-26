//
//  TestProxy.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class TestProxy {
    
    let proxy = FileDownloaderProxy()
    
    func test() {
        
        proxy.isPremiumUser = false
        proxy.fastDownload()
        
        proxy.isPremiumUser = true
        proxy.fastDownload()
        
    }
    
}
