//
//  Speaker.swift
//  Mobile Development
//
//  Created by user231747 on 12/19/22.
//

import Foundation

struct FieldsSpeaker: Codable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "Name"
    }
}

struct Speaker: Codable {
    let id: String
    let fields: FieldsSpeaker
}
