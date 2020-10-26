//
//  Comand.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

// MARK: Class for Command

protocol BaseCommand {
    func execute()
    func undo()
}

class FirstCommand: BaseCommand {
    
    private var originalSt: String
    private var currentSt: String
    
    init(with args: String) {
        originalSt = args
        currentSt = args
    }
    
    func execute() {
        currentSt = "This is a new string"
        printSt()
        print("execute called")
    }
    
    func undo() {
        currentSt = originalSt
        printSt()
        print("Undo of execute command called")
    }
    
    func printSt() {
        print("Current string is equal to \(currentSt)")
    }
}

class SecondCommand: BaseCommand {
    
    private var originalNum: Int
    private var currentNum: Int
    
    init(with args: Int) {
        originalNum = args
        currentNum = args
    }
    
    func execute() {
        currentNum += 1
        printNumber()
    }
    
    func undo() {
        if currentNum > originalNum {
            currentNum -= 1
        }
        printNumber()
    }
    
    func printNumber() {
        print("Current number is \(currentNum)")
    }
}

class CommandExecutor {
    
    private var commands: [BaseCommand] = []
    
    func add(_ command: BaseCommand) {
        commands.append(command)
    }
    
    func executeCommands() {
        for command in commands {
            command.execute()
        }
    }
    
    func undoAll() {
        for command in commands {
            command.undo()
        }
    }
    
}


