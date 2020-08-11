//
//  RewardListTableViewCell.swift
//  Locla
//
//  Created by Edward da Costa on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardListTableViewCell: UITableViewCell {

    @IBOutlet weak var lokasiReward: UILabel!
    @IBOutlet weak var namaReward: UILabel!
    @IBOutlet weak var imgReward: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    
       imgReward.layer.cornerRadius = 10
        //imgReward.backgroundColor = UIColor.init(red: 250/255, green: 120/255, blue: 0/255, alpha: 100)
        
        // Initialization code
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
