//
//  LocationFilter.swift
//  Mobile Development
//
//  Created by user231371 on 12/19/22.
//

import Foundation

enum LocationFilter: String {
    
    static var allLocations: [LocationFilter] {
        return [.all, .presidentDiningHall, .sapphireRoom, .grandBallroom, .emeraldRoom, .pearlRoom, .jadeRoom, .rubyRoom]
    }
    
    case all = "Event locations"
    case presidentDiningHall = "President's dining hall"
    case sapphireRoom = "Sapphire room"
    case grandBallroom = "Grand ballroom"
    case emeraldRoom = "Emeral room"
    case pearlRoom = "Pearl room"
    case jadeRoom = "Jade room"
    case rubyRoom = "Ruby room"
}
