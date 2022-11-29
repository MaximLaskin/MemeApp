//
//  NetworkManager.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import Foundation

enum List: String {
    case url = "https://meme-api.herokuapp.com/gimme/50"
}

class NetworkManager {
    static let shared = NetworkManager()

    func fetchMemes(url: String, completion: @escaping([Meme])  -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let memeApp = try decoder.decode([Meme].self, from: data)
                completion(memeApp)
            } catch {
                print("no data")
            }
        }.resume()

    }
    private init() {}
}
