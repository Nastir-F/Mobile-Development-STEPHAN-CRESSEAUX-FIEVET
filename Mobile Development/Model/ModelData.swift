//
//  ModelData.swift
//  Mobile Development
//
//  Created by user231747 on 12/12/22.
//

import Foundation

struct _Speaker: Codable {
    let firstName: String
    let lastName: String
}

struct _Event: Codable{
    let activity: String
    let type: String
    let start: String // TODO : passez en Date
    let end: String // TODO : passez en Date
    let location: String
    let speakers: [_Speaker]
    let notes: String
}

struct Records: Codable {
    let records: [_Event]
}

// get the api

// Créer une URL à partir du lien AirTable


protocol RequestProtocol {
    func createRequest(urlStr: String)-> URLRequest
    func getEventList(callback: @escaping ([_Event]?) -> Void)
}

struct Request : RequestProtocol{
    func createRequest(urlStr: String) -> URLRequest {
        let url: URL = URL(string: urlStr)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let accessToken = "keymaCPSexfxC2hF9"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        return request
        
    }
    
    func getEventList(callback: @escaping ([_Event]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with:createRequest(urlStr: "https://airtable.com/appLxCaCuYWnjaSKB/tblon3PzkaCkPGUnr/viwPg3QwJjoQEsQSQ?blocks=bipJnNThSVcQsRsOE")) { data, response, error in
            guard let data = data, error == nil else {
                //gérer l'erreur
                callback(nil)
                return
            }
            guard let responseHttp = response as? HTTPURLResponse, responseHttp.statusCode == 200 else {
                //gérer mon erreur
                callback(nil)
                return
            }
            if let response = try? JSONDecoder().decode(Records.self, from: data) {
                callback(response.records)
            }
            else {
                callback(nil)
            }
        }
        task.resume()
    }
}
