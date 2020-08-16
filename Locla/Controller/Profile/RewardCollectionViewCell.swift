//
//  RewardCollectionViewCell.swift
//  Locla
//
//  Created by Rizal Hidayat on 15/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rewardIV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 1.0
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.masksToBounds = false
        layer.backgroundColor = UIColor.white.cgColor
    }
}
