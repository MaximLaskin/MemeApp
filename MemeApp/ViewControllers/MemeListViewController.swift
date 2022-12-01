//
//  ListViewController.swift
//  MemeApp
//
//  Created by Maxim on 24.11.2022.
//

import UIKit

final class MemeListViewController: UITableViewController {
    private var memes: [Meme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMemes()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath) as? MemeViewCell
        else {
            return UITableViewCell()
        }

        let meme = memes[indexPath.row]
        cell.configure(with: meme)

        return cell
    }

    private func fetchMemes() {
        NetworkManager.shared.fetch(dataType: MemeApp.self, url: List.url.rawValue) { memeApp in
            self.memes = memeApp.memes
            self.tableView.reloadData()
        }
    }

    // MARK: - Navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
     */
}
