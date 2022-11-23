//
//  ViewController.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import UIKit

class MemeListViewController: UITableViewController  {

    var memes: [Meme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMemes()

    }

    private func fetchMemes() {
        NetworkManager.shared.fetchMemes(url: List.url.rawValue) { memes in
            self.memes = memes
        }
    }
}

extension MemeListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MemeViewCell else {
            return UITableViewCell()
        }

        let meme = memes[indexPath.row]

        return cell
    }
}

