//
//  ModelData.swift
//  Mobile Development
//
//  Created by user231371 on 12/12/22.
//

import Foundation
import UIKit

struct Records: Codable {
    let records: [Event]?
}

protocol RequestFactoryProtocol {
    func createRequest(urlStr: String) -> URLRequest
    func getEventList(callback: @escaping ([Event]?) -> Void)
}

struct RequestFactory: RequestFactoryProtocol {
    func createRequest(urlStr: String) -> URLRequest {
        let url: URL = URL(string: urlStr)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let accesToken = "keymaCPSexfxC2hF9"
        request.setValue("Bearer \(accesToken)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    func getEventList(callback: @escaping ([Event]?) -> Void) {
        let session = URLSession(configuration: .default)
        let request = createRequest(urlStr: "https://api.airtable.com/v0/appLxCaCuYWnjaSKB/%F0%9F%93%86%20Schedule")
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                // error
                callback(nil)
                return
            }
            guard let responseHttp = response as? HTTPURLResponse, responseHttp.statusCode == 200 else {
                // error
                callback(nil)
                return
            }
            if let response = try? JSONDecoder().decode(Records.self, from: data) {
                callback(response.records)
            } else {
                callback(nil)
            }
        }
        task.resume()
    }
}
