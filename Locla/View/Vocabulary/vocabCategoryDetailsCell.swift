//
//  vocabCategoryDetailsCell.swift
//  Locla
//
//  Created by Bagus setiawan on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class VocabCategoryDetailsCell: UITableViewCell {
    
    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var soundButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
