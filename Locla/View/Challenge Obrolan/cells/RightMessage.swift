//
//  RightMessage.swift
//  Locla
//
//  Created by Bagus setiawan on 15/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RightMessage: UITableViewCell {
    
    @IBOutlet weak var backgroundRightMessageView : UIView!
    @IBOutlet weak var messageRightLabel : UILabel!
    @IBOutlet weak var messageRightSecondaryLabrl : UILabel!
    @IBOutlet weak var speakerBtn: UIButton!
    
    static let cellID = "RightMessage"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureBackground()
        backgroundRightMessageView.backgroundColor = .white
        
        backgroundRightMessageView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.6156862745, blue: 0.01176470588, alpha: 1)
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureBackground(){
        self.backgroundRightMessageView.layer.cornerRadius = 10
        self.speakerBtn.layer.cornerRadius = 15.5    }
    
//    func configureCell(message: ChatChallenge) {
//        messageRightLabel.text = message.opponentChatText
//       }
    
}
