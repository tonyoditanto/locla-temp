//
//  LocationTableViewCell.swift
//  Locla
//
//  Created by Edward da Costa on 17/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    @IBOutlet weak var locationIV: UIImageView!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        locationIV.backgroundColor = #colorLiteral(red: 0.9818729758, green: 0.6061103344, blue: 0.01341408864, alpha: 1)
        locationIV.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
