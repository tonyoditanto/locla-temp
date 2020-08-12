//
//  TopikCollectionViewCell.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TopikCollectionViewCell: UICollectionViewCell {
  
    static let cellID = "TopikCollectionViewCell"
    
    @IBOutlet weak var topikImageView: UIImageView!
    @IBOutlet weak var judulTopikLabel: UILabel!
    @IBOutlet weak var jumlahSubtopikLabel: UILabel!
    @IBOutlet weak var raihanBintangLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10.0
    }
    
}
