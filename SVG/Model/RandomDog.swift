//
//  RandomDog.swift
//  SVG
//
//  Created by Shivacharan Reddy on 05/01/24.
//

import Foundation

struct RandomDog: Decodable {
    
    let link: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case link = "message"
        case status
    }
}

