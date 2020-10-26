//
//  TestCommand.swift
//  PatternExample
//
//  Created by  vkrotin on 26.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class TestCommand {
    
    let commandExec = CommandExecutor()
    
    func test() {
        let cmdF = FirstCommand(with: "This is test string")
        let cmdS = SecondCommand(with: 4)
        
        commandExec.add(cmdF)
        commandExec.add(cmdS)
        
        commandExec.executeCommands()
        commandExec.undoAll()
        
    }
    
    
}
