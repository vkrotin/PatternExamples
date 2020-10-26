//
//  ModelPatterns.swift
//  PatternExample
//
//  Created by  vkrotin on 19.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//
//-------------------------------------------------------
// behavioral patterns - поведеньчиские паттерны
//
//1. Цепочка обязанностей (chain of responsibility) V
//2. Команда (command)                       V
//3. Интерпретатор (interpreter)             V
//4. Итератор (iterator)
//5. Посредник (mediator)                    V
//6. Хранитель (memento)                     V
//7. Наблюдатель (observer)                  V
//8. Состояние (state)
//9. Стратегия (strategy)                    V
//10. Шаблонный метод (template method)      V
//11. Посетитель (visitor)                   V
//
// structural patterns - структурные паттерны
//
//1. Адаптер (adapter)                       V
//2. Мост (bridge)                           V
//3. Компоновщик (composite)                 V
//4. Декоратор (decorator)                   V
//5. Фасад (facade)                          V
//6. Приспособленец (flyweight)              V
//7. Прокси (proxy)                          V
//
// generating patterns - порождающие паттерны
//
//1. Абстрактная фабрика (abstract factory)  V
//2. Строитель (builder)                     V
//3. Фабричный метод (factory method)        V
//4. Прототип (prototype)
//5. Одиночка (singleton)                    V
//-------------------------------------------------------

import Foundation


struct Pattern : Codable, Hashable {
    let id: Int
    let name: String
    let description: String?
    let parentId: Int
}

class PatternManager  {
    
    
    func displayPatternHashList() -> NSDictionary {
        var list: [Pattern : [Pattern]] = [:]
        for pattern in parsePatterns() {
            if list.index(forKey: pattern) == nil, pattern.parentId == 0 {
                list[pattern] = [Pattern]()
            }
            else if let key = list.keys.filter({ $0.id == pattern.parentId }).first {
                list[key]?.append(pattern)
            }
        }
        return list as NSDictionary
    }
    
    private func displayPatternList() -> [String : [Pattern]] {
        var list: [String : [Pattern]] = [:]
        for pattern in parsePatterns() {
            let parentId = String(pattern.parentId)
            if list.index(forKey: parentId) == nil {
                list[parentId] = [Pattern]()
            }
            list[parentId]?.append(pattern)
        }
        return list
    }
    
    
    private func parsePatterns() -> [Pattern] {
        let url = Bundle.main.url(forResource: "Patterns", withExtension: "plist")!
        let decoder = PropertyListDecoder()
        var listArray: [Pattern] = []
        do {
            let data = try Data(contentsOf: url)
            listArray = try decoder.decode([Pattern].self, from: data)
        } catch {
            print("No parse plist data file")
        }
        return listArray
    }

    
}
