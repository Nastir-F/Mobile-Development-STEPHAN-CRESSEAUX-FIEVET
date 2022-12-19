//
//  DayFilter.swift
//  Mobile Development
//
//  Created by user231371 on 12/19/22.
//

import Foundation

enum DayFilter: String {
    
    static var allDays: [DayFilter] {
        return [.dayOne, .dayTwo]
    }
    
    case dayOne = "08/02/23"
    case dayTwo = "09/02/23"
}
