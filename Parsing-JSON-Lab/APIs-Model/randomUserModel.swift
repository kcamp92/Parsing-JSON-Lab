//
//  randomUserModel.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/27/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct UserData: Codable {
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    let results: [resultsInfo]
    
    static func getUserData(data: Data) throws ->
        [resultsInfo] {
            do {
                let userData = try JSONDecoder().decode(UserData.self, from: data)
                
                return userData.results
            }catch{
                throw JSONError.decodingError(error)
            }
    }
    
}

struct resultsInfo: Codable {
    let name: Name
    let email: String
    let location: Location
    let dob: DOB
    let phone: String
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    //let postcode: String
}

struct DOB: Codable {
    let date: String
}
