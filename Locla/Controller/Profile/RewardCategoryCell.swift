//
//  RewardTableViewCell.swift
//  Locla
//
//  Created by Edward da Costa on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardCategoryCell: UITableViewCell {

    @IBOutlet weak var rewardCategoryLbl: UILabel!
    @IBOutlet weak var starLbl: UILabel!
    @IBOutlet weak var container: UIView!
    var bgColor : UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.backgroundColor = bgColor
    }
    

}
