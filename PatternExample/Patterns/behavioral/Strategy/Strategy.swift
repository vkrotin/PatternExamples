//
//  Strategy.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

//MARK: Strategy methods

class BaseStrategy {
    func actionCharacter1() {
    }

    func actionCharacter2() {
    }
    func actionCharacter3() {
    }
}

class AttackStrategy : BaseStrategy {
    
    override func actionCharacter1() {
        print("Character 1: Attack all enemies!")
    }
    
    override func actionCharacter2() {
        print("Character 2: Attack all enemies!")
    }
    
    
    override func actionCharacter3() {
        print("Character 3: Attack all enemies!")
    }
}

class DefinesStrategy : BaseStrategy {
    
    override func actionCharacter1() {
        print("Character 1: Attack all enemies!")
    }
    
    override func actionCharacter2() {
       print("Character 2: Healing Character 1!")
    }
    
    override func actionCharacter3() {
        print("Character 3: Protecting Character 2!")
    }
    
}

//MARK: Strategy use

class Player {
    
    private var strategy = BaseStrategy()
    
    func change(_ strategy: BaseStrategy) {
        self.strategy = strategy
    }
    
    func makeAction() {
        strategy.actionCharacter1()
        strategy.actionCharacter2()
        strategy.actionCharacter3()
    }
}
