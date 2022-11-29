//
//  Meme.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import Foundation

struct MemeApp: Decodable {
    let memes: [Meme]
}

struct Meme: Codable {
//    var id = UUID()
    let author: String?
    let title: String?
    let ups: Int?
}

