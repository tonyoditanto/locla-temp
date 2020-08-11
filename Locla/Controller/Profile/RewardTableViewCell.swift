//
//  RewardTableViewCell.swift
//  Locla
//
//  Created by Edward da Costa on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        bgRewardCell.layer.cornerRadius = 10
        bgRewardCell.backgroundColor = UIColor.init(red: 250/255, green: 120/255, blue: 0/255, alpha: 100)
        //hadiahCell.image = UIImage(named: "reward")
        // Initialization code
    }

    @IBOutlet weak var textReward: UILabel!
    @IBOutlet weak var hadiahCell: UIImageView!
    @IBOutlet weak var labelReward: UILabel!
    @IBOutlet weak var bgRewardCell: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
