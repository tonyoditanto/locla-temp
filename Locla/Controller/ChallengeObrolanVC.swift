//
//  ChallengeObrolanVC.swift
//  Locla
//
//  Created by Bagus setiawan on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ChallengeObrolanVC: UIViewController {
    
    @IBOutlet weak var profilIV: UIImageView!
    @IBOutlet weak var nameProfilLbl: UILabel!
    @IBOutlet weak var identityProfilLbl: UILabel!
    
    @IBOutlet weak var listChatTableView: UITableView!
    @IBOutlet weak var viewInputUser: UIView!
    @IBOutlet weak var failedNotification1Lbl: UILabel!
    @IBOutlet weak var failedNotification2Lbl: UILabel!
    @IBOutlet weak var selfChatTexLblt: UIStackView!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var answerBtn1: UIButton!
    @IBOutlet weak var answerBtn2: UIButton!
    @IBOutlet weak var answerBtn3: UIButton!
    @IBOutlet weak var answerBtn4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   func configureFailiedNotif(){
          self.failedNotification1Lbl.isHidden = true
          self.failedNotification2Lbl.isHidden = true
      }
    
    func configureButton(){
        self.submitBtn.layer.cornerRadius = 20.0
        self.answerBtn1.layer.cornerRadius = 5.0
        self.answerBtn2.layer.cornerRadius = 5.0
        self.answerBtn3.layer.cornerRadius = 5.0
        self.answerBtn4.layer.cornerRadius = 5.0
    }
    
    @IBAction func didTapCloseBtn(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
        
    }
    

}
