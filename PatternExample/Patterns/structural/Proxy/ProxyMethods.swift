//
//  ProxyMethods.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

protocol FileDownloaderProtocol {
    func fastDownload()
    func slowDownload()
}


class FileDownloader: FileDownloaderProtocol {
    
    func fastDownload() {
        print("Shuuuuuh, already downloaded...")
    }
    
    func slowDownload() {
        print("Sloooooowly downloading...")
    }
}

class FileDownloaderProxy: FileDownloaderProtocol {
    
    private let fileDownloader = FileDownloader()
    
    var isPremiumUser: Bool = false
    
    
    func fastDownload() {
        if isPremiumUser == false {
            slowDownload()
            return
        }
        
        checkNetwork()
        fileDownloader.fastDownload()
    }
    
    func slowDownload() {
        checkNetwork()
        fileDownloader.slowDownload()
    }
    
    func checkNetwork() {
        print("Checking network connectivity...")
    }
}
