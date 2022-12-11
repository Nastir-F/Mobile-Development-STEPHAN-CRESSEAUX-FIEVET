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
    let start: String // TODO : passez en Date
    let end: String // TODO : passez en Date
    let location: String
    let speakers: [Speaker]
    let notes: String
    
}
