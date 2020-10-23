//
//  TestVisitor.swift
//  PatternExample
//
//  Created by  vkrotin on 22.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation


class TestVisitor {
    
    private let localWarehouse = Warehouse()
    private let visitor = PriceCheckerVisitor()
    private let qualityVisitor = QualityCheckerVisitor()
    
    func test() {
        
        addItems()
        
        localWarehouse.accept(visitor)
        localWarehouse.accept(qualityVisitor)
    }
    
    private func addItems() {
        localWarehouse.add(WarehouseItem("Item 1", 23, false))
        localWarehouse.add(WarehouseItem("Item 2", 100, false))
        localWarehouse.add(WarehouseItem("Item 3", 443, true))
        localWarehouse.add(WarehouseItem("Item 4", 10, false))
        localWarehouse.add(WarehouseItem("Item 5", 432, true))
        localWarehouse.add(WarehouseItem("Item 6", 2, false))
        localWarehouse.add(WarehouseItem("Item 7", 35, true))
        localWarehouse.add(WarehouseItem("Item 8", 76, true))
    }
    
}
