//
//  NetworkManager.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import Foundation

enum List: String {
    case url = "https://api.imgflip.com/get_memes"
}

class NetworkManager {
    static let shared = NetworkManager()

    func fetch<T: Decodable>(dataType: T.Type, url: String, completion: @escaping(T) -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(type)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    private init() {}
}
