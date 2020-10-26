//
//  Flyweight.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import UIKit

//MARK: Implementation Flyweight

class BaseUnit {
    
    let name: String
    let health: Int
    var image: UIImage?
    
    private let flyweight = FlyweightImageFactory()
    
    init(_ name: String, _ health: Int, _ imageName: String) {
        self.name = name
        self.health = health
        self.image = flyweight.get(image: imageName)
    }
}

class FlyweightImageFactory {
    private var imagesCash : [String: UIImage] = [:]
    
    func get(image name: String) -> UIImage? {
        
        guard let image = imagesCash[name] else {
            let image = UIImage(named: "\(name).png")
            imagesCash[name] = image
            print("Load image of the \(name)")
            return image
        }
        return image
    }
}

//MARK: Class for test Flyweight

class Dragon: BaseUnit {
    
    class func dragon() -> Dragon {
        return Dragon("Dragon", 1243234343, "dragon")
    }
}

class Goblin : BaseUnit {
    class func goblin() -> Dragon {
        return Dragon("Goblin", 40, "goblin")
    }
}

