//
//  BaseHeadphones.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class BaseHeadphones {
    
    func playSimpleSound() {
        
    }
    
    func playBassSound() {
        
    }
}

class CheapHeadphones: BaseHeadphones {
    
    override func playBassSound() {
        print("puf - puf - pufhrrr")
    }
    
    override func playSimpleSound() {
        print("beep - beep - bhhhrhrhrep")
    }
    
}

class ExpensiveHeadphones: BaseHeadphones {
    
    override func playBassSound() {
        print("Bam-Bam-Bam")
    }
    
    override func playSimpleSound() {
        print("Beep-Beep-Beep Taram - Rararam")
    }
}


class MusicPlayer {
    
    var headPhones: BaseHeadphones?
    
    func play() {
        headPhones?.playSimpleSound()
        headPhones?.playBassSound()
    }
}
