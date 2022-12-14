//
//  MemeViewCell.swift
//  MemeApp
//
//  Created by Maxim on 23.11.2022.
//

import UIKit

class MemeViewCell: UICollectionViewCell {

    @IBOutlet var imageMemeView: UIImageView!
    @IBOutlet var nameView: UILabel!


    func configure(with meme: Meme) {
        nameView.text = meme.name
    }

   
}
