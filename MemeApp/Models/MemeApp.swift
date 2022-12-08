//
//  Meme.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import Foundation
//
//struct MemeApp: Decodable {
//    let memes: [Meme]
//}
//
//struct Meme: Codable {
//    let author: String?
//    let title: String?
//    let ups: Int?
//}

// MARK: - Welcome
struct Welcome: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount, captions: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
        case captions
    }
}
