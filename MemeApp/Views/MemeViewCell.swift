//
//  MemeViewCell.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import UIKit

class MemeViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var upsLabel: UILabel!
    @IBOutlet var memeImage: UIImageView!

    func configure(with meme: Meme) {
        titleLabel.text = meme.title
        upsLabel.text = "\(meme.ups ?? 0)"
    }
}
