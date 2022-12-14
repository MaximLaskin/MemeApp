//
//  ListViewController.swift
//  MemeApp
//
//  Created by Maxim on 24.11.2022.
//

import UIKit

final class MemeListViewController: UICollectionViewController {
    private var memes: [Meme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMemes()
    }

    // MARK: - Collection view data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MemeViewCell
        let meme = memes[indexPath.row]
        cell.configure(with: meme)

        return cell
    }

    private func fetchMemes() {
        NetworkManager.shared.fetch(dataType: MemeApp.self, url: List.url.rawValue) { memeApp in
            self.memes = memeApp.data.memes
            self.collectionView.reloadData()

        }
    }

    // MARK: - Navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
     */
}
