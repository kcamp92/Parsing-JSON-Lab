//
//  colorsModel.swift
//  Parsing-JSON-Lab
//
//  Created by Krystal Campbell on 8/27/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    let colors: [colorInfo]
    
        static func getColorData(data: Data) throws ->
            [colorInfo] {
                do {
                    let colorData = try JSONDecoder().decode(ColorData.self, from: data)
    
                    return colorData.colors
                }catch{
                    throw JSONError.decodingError(error)
                }
        }

    struct colorInfo: Codable {
        let hex: Hex
        let rgb: RGB
        let name: Name
    }
    
    struct Name: Codable {
        let value: String
        
    }
    
    struct Hex: Codable {
        let clean: String
    }
    
    struct RGB: Codable {
        let fraction: Fraction
    }
    
    struct Fraction: Codable {
        let r: Double
        let g: Double
        let b: Double
    }
}
