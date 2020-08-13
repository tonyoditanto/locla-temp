//
//  NewWordsCollectionViewCell.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class NewWordsCollectionViewCell: UICollectionViewCell {

    static let cellID = "NewWordsCollectionViewCell"
    
    @IBOutlet weak var newWordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBackground()
        configureLabel()
    }
    
    func configureBackground(){
        self.layer.cornerRadius = 2.0
    }
    
    func configureLabel(){
        self.newWordLabel.text = "kon"
    }
}
