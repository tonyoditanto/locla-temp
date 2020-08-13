//
//  ListKosakataTableViewCell.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ListKosakataTableViewCell: UITableViewCell {

    static let cellID = "ListKosakataTableViewCell"
    @IBOutlet weak var kosakataLabel: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabel()
        configureBackground()
    }

    func configureLabel(){
        self.kosakataLabel.text = "Aku = Aku"
    }
    
    func configureBackground(){
        self.backgroundCellView.layer.cornerRadius = 10.0
    }
    
    
    @IBAction func didTapSoundButton(_ sender: Any) {
        
    }
    
}
