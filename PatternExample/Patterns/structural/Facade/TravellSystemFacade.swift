//
//  TravellSystemFacade.swift
//  PatternExample
//
//  Created by  vkrotin on 21.10.2020.
//  Copyright © 2020  vkrotin. All rights reserved.
//

import Foundation

class TravellSystemFacade {
    
    func travel(to location: String) {
        
        let pf = PathFinder()
        let te = TravellEngine()
        let tp = TicketPrinitingSystem()
        
        pf.findCurrentLocation()
        pf.findLocationToTravel(location)
        pf.makeARoute()
        
        te.findTransport()
        te.orderTransport()
        
        tp.createTicket()
        tp.printingTicket()
        
        te.travel()
    }
    
}
