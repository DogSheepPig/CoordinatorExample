//
//  Event.swift
//  Evolve
//
//  Created by Artem Havriushov on 2/19/18.
//  Copyright © 2018 Evolve Biologix. All rights reserved.
//

protocol Event {
    
    var type: String { get }
    
}

extension Event {
    
    var type: String {
        return String(reflecting: Swift.type(of: self))
    }
    
}
