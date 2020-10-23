//
//  NSDictionaryMod.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


//MARK: Modificate Dictionary for Pattern struct

extension NSDictionary {
    
    func key(in section: Int) -> Pattern? {
        return allKeys[section] as? Pattern
    }
    
    func values(in section: Int) -> [Pattern]? {
        guard let key = allKeys[section] as? Pattern,
              let array = object(forKey: key) as? [Pattern] else {
                return nil
        }
        return array
    }
    
    func value(at indexPath: IndexPath) -> Pattern? {
        guard let values = values(in: indexPath.section)else {
            return nil
        }
        return values[indexPath.row]
    }
}
