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
    
    var totalQuestion = 2
    var currentQuestion = 1
    var selfChatText = "# nggak # boso jowo ?"
    var tempSelfChatText = ""
    var choiceA = "iso"
    var choiceB = "sak"
    var choiceC = "kon"
    var choiceD = "piro"
    var answerFill1 = "kon"
    var answerFill2 = "iso"
    var userChoice = ""
    var userChoice1 = "#"
    var userChoice2 = "#"
    var indexBlank1 = 0
    var indexBlank2 = 0
    var answer1 = 0
    var answer2 = 0
    
    
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
        tempSelfChatText = selfChatText
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
    
    func checkIndexBlank(){
        let arrays = selfChatText.components(separatedBy: " ")
        var totalNotFilled = 0
        
        for index in 1...arrays.count {
            if totalNotFilled == 0 && arrays[index-1] == "#"{
                self.indexBlank1 = index-1
                totalNotFilled += 1
            }else
            if totalNotFilled == 1 && arrays[index-1] == "#"{
                self.indexBlank2 = index-1
                totalNotFilled += 1
            }
        }
    }
    
    func clickedButton(){
        var tempSelfChatTextArray = tempSelfChatText.components(separatedBy: " ")
        tempSelfChatTextArray[indexBlank1] = userChoice1
        tempSelfChatTextArray[indexBlank2] = userChoice2
        tempSelfChatText = tempSelfChatTextArray.joined(separator: " ")
        selfChatLabel.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
    }
    
    @IBAction func didTapOptionAButton(_ sender: Any) {
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.buttonA.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceA)
                self.userChoice = choiceA
            }
            if (activeFilledBlank() == 1) && (self.buttonA.backgroundColor == UIColor.green){
                self.buttonA.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceA
                self.buttonA.backgroundColor = UIColor.green
                clickedButton()
            }
            else
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceA{
                    self.userChoice1 = "#"
                    self.buttonA.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceA{
                    self.userChoice2 = choiceA
                    self.buttonA.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceA{
                    self.userChoice2 = "#"
                    self.buttonA.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice2 != choiceA{
                    self.userChoice1 = choiceA
                    self.buttonA.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceA{
                    self.userChoice1 = "#"
                    self.buttonA.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice2 == choiceA{
                    self.userChoice2 = "#"
                    self.buttonA.backgroundColor = colors[0]
                    clickedButton()
                }
            }
        }
        
    }
    
    @IBAction func didTapOptionBButton(_ sender: Any) {
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.buttonB.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceB)
                self.userChoice = choiceB
            }else
            if (activeFilledBlank() == 1) && (self.buttonB.backgroundColor == UIColor.green){
                self.buttonB.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceB
                self.buttonB.backgroundColor = UIColor.green
                clickedButton()
            }
            else
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceB{
                    self.userChoice1 = "#"
                    self.buttonB.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceB{
                    self.userChoice2 = choiceB
                    self.buttonB.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceB{
                    self.userChoice2 = "#"
                    self.buttonB.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 != choiceB{
                    self.userChoice1 = choiceB
                    self.buttonB.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceB{
                    self.userChoice1 = "#"
                    self.buttonB.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 == choiceB{
                    self.userChoice2 = "#"
                    self.buttonB.backgroundColor = colors[0]
                    clickedButton()
                }
            }
        }
    }
    
    @IBAction func didTapOptionCButton(_ sender: Any) {
        if checkTotalBlank() == 1 {
            if activeFilledBlank() == 0{
                self.buttonC.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceC)
                self.userChoice = choiceC
            }else
            if (activeFilledBlank() == 1) && (self.buttonC.backgroundColor == UIColor.green){
                self.buttonC.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceC
                self.buttonC.backgroundColor = UIColor.green
                clickedButton()
            }
            else
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceC{
                    self.userChoice1 = "#"
                    self.buttonC.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceC{
                    self.userChoice2 = choiceC
                    self.buttonC.backgroundColor = UIColor.green
                    clickedButton()
                }
            }else
            
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceC{
                    self.userChoice2 = "#"
                    self.buttonC.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 != choiceC{
                    self.userChoice1 = choiceC
                    self.buttonC.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceC{
                    self.userChoice1 = "#"
                    self.buttonC.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 == choiceC{
                    self.userChoice2 = "#"
                    self.buttonC.backgroundColor = colors[0]
                    clickedButton()
                }
            }
        }
    }
    
    @IBAction func didTapOptionDButton(_ sender: Any) {
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.buttonD.backgroundColor = UIColor.green
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: choiceD)
                self.userChoice = choiceD
            }else
            if (activeFilledBlank() == 1) && (self.buttonD.backgroundColor == UIColor.green){
                self.buttonD.backgroundColor = colors[0]
                selfChatLabel.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceD
                self.buttonD.backgroundColor = UIColor.green
                clickedButton()
            }else
            
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceD{
                    self.userChoice1 = "#"
                    self.buttonD.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceD{
                    self.userChoice2 = choiceD
                    self.buttonD.backgroundColor = UIColor.green
                    clickedButton()
                }
            }else
            
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceD{
                    self.userChoice2 = "#"
                    self.buttonD.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 != choiceD{
                    self.userChoice1 = choiceD
                    self.buttonD.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceD{
                    self.userChoice1 = "#"
                    self.buttonD.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 == choiceD{
                    self.userChoice2 = "#"
                    self.buttonD.backgroundColor = colors[0]
                    clickedButton()
                }
            }
        }
    }
    
    func checkAnswer()->Bool{
        var answer = false
        if checkTotalBlank() == 1{
            if self.userChoice == answerFill1{
                answer = true
            }
        }else
        if checkTotalBlank() == 2 {
            if ((self.userChoice1 == answerFill1) && (self.userChoice2 == answerFill2)){
                answer = true
            }
        }
        return answer
    }
    
    func rightAnswer(){
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertStarVC") as! AlertStarVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
        reloadChallenge()
    }
    
    func wrongAnswer(){
        self.keterangan1Label.isHidden = false
        self.keterangan2Label.isHidden = false
        if buttonA.backgroundColor == UIColor.green {
            buttonA.backgroundColor = UIColor.red
        }
        if buttonB.backgroundColor == UIColor.green {
            buttonB.backgroundColor = UIColor.red
        }
        if buttonC.backgroundColor == UIColor.green {
            buttonC.backgroundColor = UIColor.red
        }
        if buttonD.backgroundColor == UIColor.green {
            buttonD.backgroundColor = UIColor.red
        }
    }
    
    func reloadChallenge(){
        self.currentQuestion += 1
        if self.currentQuestion > self.totalQuestion{
            toResultPage()
        }
        self.progressViewLabel.text = "\(currentQuestion)/\(totalQuestion)"
        
        self.keterangan1Label.isHidden = true
        self.keterangan2Label.isHidden = true
        if self.buttonA.backgroundColor != colors[0] {
            buttonA.backgroundColor = colors[0]
        }
        if buttonB.backgroundColor != colors[0] {
            buttonB.backgroundColor = colors[0]
        }
        if buttonC.backgroundColor != colors[0] {
            buttonC.backgroundColor = colors[0]
        }
        if buttonD.backgroundColor != colors[0] {
            buttonD.backgroundColor = colors[0]
        }
    }
    
    func toResultPage(){
        if self.currentQuestion > self.totalQuestion {
            let storyboard = UIStoryboard(name: "Mendengarkan", bundle: nil)
            let destination = storyboard.instantiateViewController(identifier: "ListeningResultVC") as! ListeningResultVC
            destination.modalPresentationStyle = .fullScreen
            destination.modalTransitionStyle = .crossDissolve
            self.present(destination, animated: true, completion: nil)
        }
    }

    
    @IBAction func didTapSubmitButton(_ sender: Any) {
        if checkAnswer() == true{
            rightAnswer()
        }else if checkAnswer() == false{
            wrongAnswer()
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
