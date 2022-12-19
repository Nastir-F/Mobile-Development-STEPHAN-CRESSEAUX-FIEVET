//
//  TypeFilter.swift
//  Mobile Development
//
//  Created by user231371 on 12/19/22.
//

import Foundation

enum TypeFilter: String {
    
    static var allTypes: [TypeFilter] {
        return [.all, .meal, .panel, .keynote, .workshop, .breakoutSession, .networking]
    }
    
    case all = "Event types"
    case meal = "Meal"
    case panel = "Panel"
    case keynote = "Keynote"
    case workshop = "Workshop"
    case breakoutSession = "Breakout session"
    case networking = "Networking"
}
