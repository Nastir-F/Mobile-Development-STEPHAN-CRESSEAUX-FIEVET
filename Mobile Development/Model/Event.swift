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

struct Event {
    let activity: String
    let type: String
    let start: String
    let end: String
    let location: String
    let speakers: [Speaker]
    let notes: String
    var isDayOne = true
    
    init(activity: String, type: String, start: String, end: String, location: String, speakers: [Speaker], notes: String) {
        self.activity = activity
        self.type = type
        self.start = start
        self.end = end
        self.location = location
        self.speakers = speakers
        self.notes = notes
        
        if (self.start.contains("08T")) {
            isDayOne = true
        } else {
            isDayOne = false
        }
    }
    
}
