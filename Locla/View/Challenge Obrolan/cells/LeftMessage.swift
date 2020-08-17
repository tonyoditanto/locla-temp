//
//  LeftMessage.swift
//  Locla
//
//  Created by Bagus setiawan on 15/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class LeftMessage: UITableViewCell {
    
    @IBOutlet weak var backgorundLeftMessageView : UIView!
    @IBOutlet weak var messageLeftLabel : UILabel!
    @IBOutlet weak var messageLeftSecondaryLabel : UILabel!
    
    static let cellID = "LeftMessage"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureBackground()
        backgorundLeftMessageView.backgroundColor = .white
        
        backgorundLeftMessageView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureBackground(){
        self.backgorundLeftMessageView.layer.cornerRadius = 10
       
    }
    
//    func configureCell(message: ChatChallenge) {
//        messageLeftLabel.text = message.selfChatText
//          }
    
}
