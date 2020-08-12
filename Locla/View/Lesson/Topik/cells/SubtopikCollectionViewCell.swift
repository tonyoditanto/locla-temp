//
//  SubtopikCollectionViewCell.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SubtopikCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    static let cellID = "SubtopikCollectionViewCell"
    
    @IBOutlet weak var judulSubtopikLabel: UILabel!
    @IBOutlet weak var jenisChallengeLabel: UILabel!
    @IBOutlet weak var raihanBintangLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBackground()
        configureLabel()
    }
    
    func configureBackground(){
        self.layer.cornerRadius = 10.0
    }
    
    func configureLabel(){
        judulSubtopikLabel.text = "Siapa Aku, Siapa Dia?"
        jenisChallengeLabel.text = "Kosakata"
        raihanBintangLabel.text = "6/9"
    }

}
