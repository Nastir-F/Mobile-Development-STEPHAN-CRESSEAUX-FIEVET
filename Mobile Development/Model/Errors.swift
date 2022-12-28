//
//  Errors.swift
//  Mobile Development
//
//  Created by user231747 on 12/25/22.
//
import Foundation

struct FieldsErrors: Codable {
    var isError: Bool
    var message: String
}

struct Errors: Codable {
    let id: String
    var fields: FieldsErrors
}
