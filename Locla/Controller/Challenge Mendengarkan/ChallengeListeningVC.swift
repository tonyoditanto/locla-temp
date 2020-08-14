//
//  ChallengeListeningVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ChallengeListeningVC: UIViewController {

    var colors : [UIColor] = [#colorLiteral(red: 0.9764705882, green: 0.6156862745, blue: 0.01176470588, alpha: 1),#colorLiteral(red: 0.3098039216, green: 0.4196078431, blue: 0.862745098, alpha: 1),#colorLiteral(red: 0.5215686275, green: 0.368627451, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1),#colorLiteral(red: 0.5568627451, green: 0.7490196078, blue: 0.4039215686, alpha: 1),#colorLiteral(red: 0.4901960784, green: 0.1411764706, blue: 0.2274509804, alpha: 1)]
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressViewLabel: UILabel!
    @IBOutlet weak var subtopikImageView: UIImageView!
    @IBOutlet weak var pertanyaanLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var viewInputUser: UIView!
    @IBOutlet weak var keterangan1Label: UILabel!
    @IBOutlet weak var keterangan2Label: UILabel!
    @IBOutlet weak var selfChatLabel: UILabel!
    
    
    
    
    enum TotalBlank: Int {
        case blank1 = 1
        case blank2 = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempSelfChatText = self.selfChatText
        configureKeterangan()
        configureProgressView()
        configureButton()
        configureImage()
        configureLabel()
        configureAnswer()
        configureInputUser()
        checkIndexBlank()
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
        self.buttonA.setTitle(self.choiceA, for: .normal)
        self.buttonB.setTitle(self.choiceB, for: .normal)
        self.buttonC.setTitle(self.choiceC, for: .normal)
        self.buttonD.setTitle(self.choiceD, for: .normal)

    }
    
    func configureLabel(){
        pertanyaanLabel.text = "Apa bahasa surabaya dari “Kamu nggak bisa bahasa jawa ya?”"
        selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
    }
    
    func configureImage(){
        subtopikImageView.image = UIImage(named: "people1")
    }
    
    func configureInputUser(){
        self.viewInputUser.layer.cornerRadius = 50
        self.viewInputUser.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configureFillTheBlank(){
//        let selfChat = selfChatText.components(separatedBy: "+")
    }
    
    func checkTotalBlank () -> Int {
        var totalBlank = 0
        let array = selfChatText.components(separatedBy: " ")
        for index in 1...array.count {
            if(array[index-1] == "#"){
                totalBlank += 1
            }
        }
        return totalBlank
    }
    
    
    func activeFilledBlank () -> Int {
        var activeButton = 0
        if buttonA.backgroundColor == UIColor.green {
            activeButton += 1
        }
        if buttonB.backgroundColor == UIColor.green {
            activeButton += 1
        }
        if buttonC.backgroundColor == UIColor.green {
            activeButton += 1
        }
        if buttonD.backgroundColor == UIColor.green {
            activeButton += 1
        }
        return activeButton
    }
    

    var selfChatText = "# nggak # boso jowo ?"
    var tempSelfChatText = ""
    var choiceA = "iso"
    var choiceB = "sak"
    var choiceC = "kon"
    var choiceD = "mbah lanang"
    var answerFill1 = "kon"
    var answerFill2 = "iso"
    var userChoice1 = ""
    var userChoice2 = ""
    var indexBlank1 = 0
    var indexBlank2 = 0
    var answer1 = 0
    var answer2 = 0
    
    func checkIndexBlank(){
        let arrays = selfChatText.components(separatedBy: " ")
        //var temp = ""
        var totalNotFilled = 0
        
        for index in 1...arrays.count {
            if totalNotFilled == 0 && arrays[index-1] == "#"{
                self.indexBlank1 = index-1
                totalNotFilled += 1
            }
            if totalNotFilled == 1 && arrays[index-1] == "#"{
                self.indexBlank2 = index-1
                totalNotFilled += 1
            }
        }
        
    }
    
    @IBAction func didTapOptionAButton(_ sender: Any) {
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.buttonA.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceA)
                self.userChoice1 = choiceA
            }else
            if (activeFilledBlank() == 1) && (self.buttonA.backgroundColor == UIColor.green){
                self.buttonA.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if activeFilledBlank() == 0{
                self.buttonA.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = choiceA
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = choiceA
            }else
            if (activeFilledBlank() == 1) && (self.buttonA.backgroundColor != UIColor.green){
                self.buttonA.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank2] = choiceA
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                self.userChoice2 = choiceA
            }else
            if (activeFilledBlank() == 1) && (self.buttonA.backgroundColor == UIColor.green){
                self.buttonA.backgroundColor = colors[0]
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = "#"
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = "___"
            }else
            if (activeFilledBlank() == 2) && (self.buttonA.backgroundColor == UIColor.green){
                self.buttonA.backgroundColor = colors[0]
                if choiceA == userChoice1 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank1] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice2)
                    self.userChoice1 = "___"
                }
                if choiceA == userChoice2 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank2] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                    self.userChoice2 = "___"
                }
            }
        }
        
    }
    
    @IBAction func didTapOptionBButton(_ sender: Any) {
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.buttonB.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceB)
                self.userChoice1 = choiceB
            }else
            if (activeFilledBlank() == 1) && (self.buttonB.backgroundColor == UIColor.green){
                self.buttonB.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if activeFilledBlank() == 0{
                self.buttonB.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = choiceB
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = choiceB
            }else
            if (activeFilledBlank() == 1) && (self.buttonB.backgroundColor != UIColor.green){
                self.buttonB.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank2] = choiceB
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                self.userChoice2 = choiceB
            }else
            if (activeFilledBlank() == 1) && (self.buttonB.backgroundColor == UIColor.green){
                self.buttonB.backgroundColor = colors[0]
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = "#"
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = "___"
            }else
            if (activeFilledBlank() == 2) && (self.buttonB.backgroundColor == UIColor.green){
                self.buttonB.backgroundColor = colors[0]
                if choiceB == userChoice1 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank1] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice2)
                    self.userChoice1 = "___"
                }
                if choiceB == userChoice2 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank2] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                    self.userChoice2 = "___"
                }
            }
        }
    }
    
    @IBAction func didTapOptionCButton(_ sender: Any) {
        if checkTotalBlank() == 1 {
            if activeFilledBlank() == 0{
                self.buttonC.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceC)
                self.answerFill1 = choiceC
            }else
            if (activeFilledBlank() == 1) && (self.buttonC.backgroundColor == UIColor.green){
                self.buttonC.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.answerFill1 = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if activeFilledBlank() == 0{
                self.buttonC.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = choiceC
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = choiceC
            }else
            if (activeFilledBlank() == 1) && (self.buttonC.backgroundColor != UIColor.green){
                self.buttonC.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank2] = choiceC
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                self.userChoice2 = choiceC
            }else
            if (activeFilledBlank() == 1) && (self.buttonC.backgroundColor == UIColor.green){
                self.buttonC.backgroundColor = colors[0]
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = "#"
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = "___"
            }else
            if (activeFilledBlank() == 2) && (self.buttonC.backgroundColor == UIColor.green){
                self.buttonC.backgroundColor = colors[0]
                if choiceC == userChoice1 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank1] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice2)
                    self.userChoice1 = "___"
                }
                if choiceC == userChoice2 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank2] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                    self.userChoice2 = "___"
                }
            }
        }
    }
    
    @IBAction func didTapOptionDButton(_ sender: Any) {
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.buttonD.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceD)
                self.answerFill1 = choiceD
            }else
            if (activeFilledBlank() == 1) && (self.buttonD.backgroundColor == UIColor.green){
                self.buttonD.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.answerFill1 = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if activeFilledBlank() == 0{
                self.buttonD.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = choiceD
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = choiceD
            }else
            if (activeFilledBlank() == 1) && (self.buttonD.backgroundColor != UIColor.green){
                self.buttonD.backgroundColor = UIColor.green
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank2] = choiceD
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                self.userChoice2 = choiceD
            }else
            if (activeFilledBlank() == 1) && (self.buttonD.backgroundColor == UIColor.green){
                self.buttonD.backgroundColor = colors[0]
                var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                tempSelfChatTextArray[indexBlank1] = "#"
                let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice1 = "___"
            }else
            if (activeFilledBlank() == 2) && (self.buttonD.backgroundColor == UIColor.green){
                self.buttonD.backgroundColor = colors[0]
                if choiceD == userChoice1 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank1] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice2)
                    self.userChoice1 = "___"
                }
                if choiceD == userChoice2 {
                    var tempSelfChatTextArray = selfChatText.components(separatedBy: " ")
                    tempSelfChatTextArray[indexBlank2] = "#"
                    let tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
                    selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: self.userChoice1)
                    self.userChoice2 = "___"
                }
            }
        }
    }
    
    func checkAnswer(){
        
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
