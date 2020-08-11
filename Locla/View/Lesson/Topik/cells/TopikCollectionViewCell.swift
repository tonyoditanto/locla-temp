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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBackground()
        configureImage()
        configureLabel()
    }
    
    func configureBackground(){
        self.layer.cornerRadius = 10.0
    }
    
    func configureLabel(){
        judulTopikLabel.text = "Pengenalan"
        jumlahSubtopikLabel.text = "6 Topik"
        raihanBintangLabel.text = "12/54"
    }
    
    func configureImage(){
        topikImageView.image = UIImage(named: "people1")
    }
}
