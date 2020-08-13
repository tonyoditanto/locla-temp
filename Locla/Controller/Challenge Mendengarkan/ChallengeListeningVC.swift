//
//  ChallengeListeningVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ChallengeListeningVC: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressViewLabel: UILabel!
    @IBOutlet weak var subtopikImageView: UIImageView!
    @IBOutlet weak var pertanyaanLabel: UILabel!
    @IBOutlet weak var selfChatTextLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var viewInputUser: UIView!
    @IBOutlet weak var keterangan1Label: UILabel!
    @IBOutlet weak var keterangan2Label: UILabel!
    
    enum TotalBlank: Int {
        case blank1 = 1
        case blank2 = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureKeterangan()
        configureProgressView()
        configureButton()
        configureImage()
        configureLabel()
        configureAnswer()
        configureInputUser()
        configureLogic()
    }
    
    func configureKeterangan(){
        self.keterangan1Label.isHidden = true
        self.keterangan2Label.isHidden = true
    }
    
    func configureProgressView(){
        self.progressView.layer.cornerRadius = 10.0
        self.progressView.layer.masksToBounds = true
    }
    
    func configureButton(){
        self.submitButton.layer.cornerRadius = 20.0
        self.buttonA.layer.cornerRadius = 5.0
        self.buttonB.layer.cornerRadius = 5.0
        self.buttonC.layer.cornerRadius = 5.0
        self.buttonD.layer.cornerRadius = 5.0
    }
    
    func configureAnswer(){
        self.buttonA.setTitle("iso", for: .normal)
        self.buttonB.setTitle("sak", for: .normal)
        self.buttonC.setTitle("kon", for: .normal)
        self.buttonD.setTitle("pirosasasas", for: .normal)

    }
    
    func configureLabel(){
        pertanyaanLabel.text = "Apa bahasa surabaya dari “Kamu nggak bisa bahasa jawa ya?”"
        
        selfChatTextLabel.text = "___ nggak ___ boso jowo ta?"
    }
    
    func configureImage(){
        subtopikImageView.image = UIImage(named: "people1")
    }
    
    func configureInputUser(){
        self.viewInputUser.layer.cornerRadius = 50
        self.viewInputUser.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configureLogic(){
//        var totalBlank : TotalBlank = .blank1
//        var pertanyaan : String = "blank1, nggak , blank2, boso jowo ta?"
//        let jawaban1 = "kon"
//        let jawaban2 = "iso"
//
//        var arrays = pertanyaan.components(separatedBy: ", ")
//        for array in arrays {
//            //print(array)
//            if array == "blank2" {
//                totalBlank = .blank2
//            }
//        }
//        print(arrays[0])
//
//        switch totalBlank {
//        case .blank1:
//            print()
//        case .blank2:
//        print()
//        default:
//            print()
//        }
    }
    
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
