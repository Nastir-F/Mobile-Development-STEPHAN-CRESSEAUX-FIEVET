//
//  Errors.swift
//  Mobile Development
//
//  Created by user231747 on 12/25/22.
//
import Foundation

enum CustomError: Error {
     case generic(message: String?)
     case http
     case statusCode(code: Int)
     case parsing

     public var description: String {
         switch self {
             case .generic(let msg):
             return msg ?? "An error occured"
             case .http:
             return "Not an http response"
             case .parsing:
             return "Parsing error"
             case .statusCode(let code):
             return "Status code error : \(code) The data was not found."
         }
     }
}
