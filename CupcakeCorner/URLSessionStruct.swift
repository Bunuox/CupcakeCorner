//
//  URLSessionStruct.swift
//  CupcakeCorner
//
//  Created by Bünyamin Kılıçer on 10.02.2022.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
