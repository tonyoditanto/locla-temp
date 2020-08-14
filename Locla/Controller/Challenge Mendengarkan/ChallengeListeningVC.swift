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
    
    var selfChatText = "#+nggak+##+boso jowo ?"
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
        self.buttonD.setTitle("mbah lanang", for: .normal)

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
        //fillTheBlankStack.layer.cornerRadius = 10.0
        fillTheBlankStack.spacing = 5.0
        fillTheBlankStack.distribution = .fillProportionally
        fillTheBlankStack.alignment = .fill
        fillTheBlankStack.translatesAutoresizingMaskIntoConstraints = true
        //fillTheBlankStack.backgroundColor = .blue
//
//        fillBlank.layer.cornerRadius = 5.0
//        fillBlank.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        fillBlank.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        fillBlank.backgroundColor = .white
//
        
        let selfChat = selfChatText.components(separatedBy: "+")
        var buttonArray = [UIButton]()
        var viewArray = [UIView]()
        
        for index in 1...selfChat.count{
            if (selfChat[index-1] == "#" || selfChat[index-1] == "##"){
                viewArray += [viewSelfChatButtonContainer()]
                buttonArray += [viewSelfChatButton(withColor: UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0), title: selfChat[index-1])]
                buttonArray[index-1].layer.cornerRadius = 7.0
            }
            if selfChat[index-1] != "#" && selfChat[index-1] != "##"{
                viewArray += [viewSelfChatButtonContainer()]
                buttonArray += [viewSelfChatButton(withColor: UIColor(red: 249.0, green: 157.0, blue: 3.0, alpha: 1.0), title: selfChat[index-1])]
            }
            
            viewArray[index-1].addSubview(buttonArray[index-1])
            //self.fillTheBlankStack.addArrangedSubview(viewArray[index-1])
            self.fillTheBlankStack.addArrangedSubview(buttonArray[index-1])
        }
    }
    
    func viewSelfChatButton(withColor color:UIColor, title:String) -> UIButton{
        let newButton = UIButton(type: .system)
        
        newButton.backgroundColor = UIColor(red: 249.0, green: 157.0, blue: 3.0, alpha: 1.0)
        newButton.tintColor = color
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.black, for: .normal)
        return newButton
    }
    
    func viewSelfChatButtonContainer() -> UIView{
        let newView = UIButton(type: .system)
        return newView
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
