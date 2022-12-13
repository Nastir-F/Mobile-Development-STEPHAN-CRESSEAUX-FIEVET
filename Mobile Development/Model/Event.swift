//
//  Event.swift
//  Mobile Development
//
//  Created by user231371 on 12/11/22.
//

import Foundation
import SwiftUI

struct Speaker {
    let firstName: String
    let lastName: String
}

struct Fields: Codable {
    let activity: String
    let type: String
    let start: String
    let end: String
    let location: String
    let notes: String?
    
    enum CodingKeys: String, CodingKey {
        case activity = "Activity"
        case type = "Type"
        case start = "Start"
        case end = "End"
        case location = "Location"
        case notes = "Notes"
    }
}

struct Event: Codable {
    let id: String
    let fields: Fields
}
