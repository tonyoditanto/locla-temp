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
    @IBOutlet weak var fillTheBlankStack: UIStackView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var viewInputUser: UIView!
    @IBOutlet weak var keterangan1Label: UILabel!
    @IBOutlet weak var keterangan2Label: UILabel!
    
    var selfChatText = "# nggak ## boso jowo ?"
    var fill1 = "kon"
    var fill2 = "iso"
    var fillBlank = UIView()
    var fillBlank2 = UIView()
    var fillLabel = UILabel()
    var fillLabel2 = UILabel()
    var fillLabel3 = UILabel()
    
    
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
        configureFillTheBlank()
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
    }
    
    func configureImage(){
        subtopikImageView.image = UIImage(named: "people1")
    }
    
    func configureInputUser(){
        self.viewInputUser.layer.cornerRadius = 50
        self.viewInputUser.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configureFillTheBlank(){
        fillTheBlankStack.spacing = 5.0
        fillTheBlankStack.distribution = .fillEqually
        fillTheBlankStack.alignment = .fill
        fillTheBlankStack.translatesAutoresizingMaskIntoConstraints = true
        
        fillBlank.layer.cornerRadius = 5.0
        fillBlank.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fillBlank.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fillBlank.backgroundColor = .white
        
        fillBlank2.layer.cornerRadius = 5.0
        fillBlank2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fillBlank2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fillBlank2.backgroundColor = .white
        
        fillLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fillLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let arrays = selfChatText.components(separatedBy: " ")

        for index in 1...arrays.count {
            if arrays[index-1] == "#" {
                self.fillTheBlankStack.addArrangedSubview(fillBlank)
                //self.fillTheBlankStack.addSubview(fillBlank)
            }
            
            if arrays[index-1] == "##" {
                self.fillTheBlankStack.addArrangedSubview(fillBlank2)
                //self.fillTheBlankStack.addSubview(fillBlank)
            }
            
            if arrays[index-1] != "#" && arrays[index-1] != "##"{
                fillLabel.text = arrays[index-1]
                self.fillTheBlankStack.addArrangedSubview(fillLabel)
                //self.fillTheBlankStack.addSubview(fillLabel)
            }
            print(arrays[index-1])
            
        }
    }
    
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
