//
//  weatherModel.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/27/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    enum JSONError: Error {
        case decodingError(Error)
    }

    let list: [listInfo]
    
    static func getWeatherData(data: Data) throws ->
        [listInfo] {
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                
                return weatherData.list
            }catch{
                throw JSONError.decodingError(error)
            }
    }
    
}

struct listInfo: Codable {
    let name: String
    let weather: [weatherInfo]
    let main: Main
}

struct Main: Codable {
    let temp: Double
}
struct weatherInfo: Codable {
    let description: String
}
