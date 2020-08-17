//
//  ChallengeObrolanVC.swift
//  Locla
//
//  Created by Bagus setiawan on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ChallengeObrolanVC: UIViewController {
    
    @IBOutlet weak var messageTableView: UITableView!
    
    @IBOutlet weak var profilIV: UIImageView!
    @IBOutlet weak var nameProfilLbl: UILabel!
    @IBOutlet weak var identityProfilLbl: UILabel!
    
    @IBOutlet weak var viewInputUser: UIView!
    @IBOutlet weak var failedNotification1Lbl: UILabel!
    @IBOutlet weak var failedNotification2Lbl: UILabel!
    @IBOutlet weak var selfChatLbl: UILabel!
    
   
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var answerABtn: UIButton!
    @IBOutlet weak var answerBBtn: UIButton!
    @IBOutlet weak var answerCBtn: UIButton!
    @IBOutlet weak var answerDBtn: UIButton!
    
    var subtopicID : Int?
    var chatChallenges : [ChatChallenge] = []
    
    var colors : [UIColor] = [#colorLiteral(red: 0.9764705882, green: 0.6156862745, blue: 0.01176470588, alpha: 1),#colorLiteral(red: 0.3098039216, green: 0.4196078431, blue: 0.862745098, alpha: 1),#colorLiteral(red: 0.5215686275, green: 0.368627451, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1),#colorLiteral(red: 0.5568627451, green: 0.7490196078, blue: 0.4039215686, alpha: 1),#colorLiteral(red: 0.4901960784, green: 0.1411764706, blue: 0.2274509804, alpha: 1)]
    var totalQuestion = 2
    var currentQuestion = 1
    var selfChatText = "# Joki # !"
    var tempSelfChatText = ""
    var choiceA = "Jenengku"
    var choiceB = "Ning"
    var choiceC = "kon"
    var choiceD = "Cak"
    var answerFill1 = "Jenengku"
    var answerFill2 = "Cak"
    var userChoice = ""
    var userChoice1 = "#"
    var userChoice2 = "#"
    var indexBlank1 = 0
    var indexBlank2 = 0
    var answer1 = 0
    var answer2 = 0
    
     //et rightMessageCellIdentifier: String = "RightMessage"
     //let leftMessageCellIdentifier: String = "LeftMessage"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchChatCallenge()
        
        //messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.dataSource = self
        messageTableView.delegate = self
            //messageTableView.backgroundColor = UIColor(hexString: "E4DDD6")
       
        
        
        setupTableView()
        

        // Do any additional setup after loading the view.
        self.tempSelfChatText = self.selfChatText
        configureButton()
        configureFailedNotif()
        configureKeterangan()
        configureAnswer()
        configureInputUser()
        configureLabel()
        checkIndexBlank()
        tempSelfChatText = selfChatText
    }
    
    func fetchChatCallenge() {
        chatChallenges = DataLoader.getChatChallenges(subtopicID: subtopicID ?? 2)
    }
    
    func setupTableView()
    {
        rightMessageRegister()
        leftMessageRegister()
    }
    
    func rightMessageRegister() {
        let nib = UINib(nibName: RightMessage.cellID, bundle: Bundle.main)
        self.messageTableView.register(nib, forCellReuseIdentifier: RightMessage.cellID)
    }
    
    func leftMessageRegister() {
           let nib = UINib(nibName: LeftMessage.cellID, bundle: Bundle.main)
           self.messageTableView.register(nib, forCellReuseIdentifier: LeftMessage.cellID)
       }
    

    func configureFailedNotif(){
          self.failedNotification1Lbl.isHidden = true
          self.failedNotification2Lbl.isHidden = true
      }
    
    func configureButton(){
        self.submitBtn.layer.cornerRadius = 20.0
        self.answerABtn.layer.cornerRadius = 5.0
        self.answerBBtn.layer.cornerRadius = 5.0
        self.answerCBtn.layer.cornerRadius = 5.0
        self.answerDBtn.layer.cornerRadius = 5.0
    }
    
    func configureKeterangan(){
        self.failedNotification1Lbl.isHidden = true
        self.failedNotification2Lbl.isHidden = true
    }
    
    func configureLabel(){
        selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: "___")
    }
    
    func configureAnswer(){
        self.answerABtn.setTitle("Jenengku", for: .normal)
        self.answerBBtn.setTitle("Ning", for: .normal)
        self.answerCBtn.setTitle("Kon", for: .normal)
        self.answerDBtn.setTitle("Cak", for: .normal)

    }
    
    func configureInputUser(){
        self.viewInputUser.layer.cornerRadius = 50
        self.viewInputUser.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
        if answerABtn.backgroundColor == UIColor.green {
            activeButton += 1
        }
        if answerBBtn.backgroundColor == UIColor.green {
            activeButton += 1
        }
        if answerCBtn.backgroundColor == UIColor.green {
            activeButton += 1
        }
        if answerDBtn.backgroundColor == UIColor.green {
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
        selfChatLbl.text = tempSelfChatText.replacingOccurrences(of: "#", with: "___")
    }
    
    
    @IBAction func didTapOptionAButton(_ sender: Any) {
        
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.answerABtn.backgroundColor = UIColor.green
                selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: choiceA)
                self.userChoice = choiceA
            }
            if (activeFilledBlank() == 1) && (self.answerABtn.backgroundColor == UIColor.green){
                self.answerABtn.backgroundColor = colors[0]
                selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceA
                self.answerABtn.backgroundColor = UIColor.green
                clickedButton()
            }
            else
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceA{
                    self.userChoice1 = "#"
                    self.answerABtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceA{
                    self.userChoice2 = choiceA
                    self.answerABtn.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceA{
                    self.userChoice2 = "#"
                    self.answerABtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice2 != choiceA{
                    self.userChoice1 = choiceA
                    self.answerABtn.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceA{
                    self.userChoice1 = "#"
                    self.answerABtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice2 == choiceA{
                    self.userChoice2 = "#"
                    self.answerABtn.backgroundColor = colors[0]
                    clickedButton()
                }
            }
        }
        
        
    }
    
    @IBAction func didTapOptionBButton(_ sender: Any) {
        
      if checkTotalBlank() == 1{
          if activeFilledBlank() == 0{
              self.answerBBtn.backgroundColor = UIColor.green
            selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: choiceB)
              self.userChoice = choiceB
          }else
          if (activeFilledBlank() == 1) && (self.answerBBtn.backgroundColor == UIColor.green){
              self.answerBBtn.backgroundColor = colors[0]
              selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: "___")
              self.userChoice = ""
          }
      }
      
      if checkTotalBlank() == 2{
          if userChoice1 == "#" && userChoice2 == "#" {
              self.userChoice1 = choiceB
              self.answerBBtn.backgroundColor = UIColor.green
              clickedButton()
          }
          else
          if userChoice1 != "#" && userChoice2 == "#" {
              if userChoice1 == choiceB{
                  self.userChoice1 = "#"
                  self.answerBBtn.backgroundColor = colors[0]
                  clickedButton()
              }else
              if userChoice1 != choiceB{
                  self.userChoice2 = choiceB
                  self.answerBBtn.backgroundColor = UIColor.green
                  clickedButton()
              }
          }
          else
          if userChoice1 == "#" && userChoice2 != "#" {
              if userChoice2 == choiceB{
                  self.userChoice2 = "#"
                  self.answerBBtn.backgroundColor = colors[0]
                  clickedButton()
              }else
              
              if userChoice2 != choiceB{
                  self.userChoice1 = choiceB
                  self.answerBBtn.backgroundColor = UIColor.green
                  clickedButton()
              }
          }
          else
          if userChoice1 != "#" && userChoice2 != "#" {
              if userChoice1 == choiceB{
                  self.userChoice1 = "#"
                  self.answerBBtn.backgroundColor = colors[0]
                  clickedButton()
              }else
              
              if userChoice2 == choiceB{
                  self.userChoice2 = "#"
                  self.answerBBtn.backgroundColor = colors[0]
                  clickedButton()
              }
          }
      }
        
    }
    
    @IBAction func didTapOptionCButton(_ sender: Any) {
        
        if checkTotalBlank() == 1 {
            if activeFilledBlank() == 0{
                self.answerCBtn.backgroundColor = UIColor.green
                selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: choiceC)
                self.userChoice = choiceC
            }else
            if (activeFilledBlank() == 1) && (self.answerCBtn.backgroundColor == UIColor.green){
                self.answerCBtn.backgroundColor = colors[0]
                selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceC
                self.answerCBtn.backgroundColor = UIColor.green
                clickedButton()
            }
            else
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceC{
                    self.userChoice1 = "#"
                    self.answerCBtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceC{
                    self.userChoice2 = choiceC
                    self.answerCBtn.backgroundColor = UIColor.green
                    clickedButton()
                }
            }else
            
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceC{
                    self.userChoice2 = "#"
                    self.answerCBtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 != choiceC{
                    self.userChoice1 = choiceC
                    self.answerCBtn.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceC{
                    self.userChoice1 = "#"
                    self.answerCBtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 == choiceC{
                    self.userChoice2 = "#"
                    self.answerCBtn.backgroundColor = colors[0]
                    clickedButton()
                }
            }
        }
        
    }
    
    @IBAction func didTapOptionDButton(_ sender: Any) {
        
        if checkTotalBlank() == 1{
            if activeFilledBlank() == 0{
                self.answerDBtn.backgroundColor = UIColor.green
                selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: choiceD)
                self.userChoice = choiceD
            }else
            if (activeFilledBlank() == 1) && (self.answerDBtn.backgroundColor == UIColor.green){
                self.answerDBtn.backgroundColor = colors[0]
                selfChatLbl.text = selfChatText.replacingOccurrences(of: "#", with: "___")
                self.userChoice = ""
            }
        }
        
        if checkTotalBlank() == 2{
            if userChoice1 == "#" && userChoice2 == "#" {
                self.userChoice1 = choiceD
                self.answerDBtn.backgroundColor = UIColor.green
                clickedButton()
            }else
            
            if userChoice1 != "#" && userChoice2 == "#" {
                if userChoice1 == choiceD{
                    self.userChoice1 = "#"
                    self.answerDBtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                if userChoice1 != choiceD{
                    self.userChoice2 = choiceD
                    self.answerDBtn.backgroundColor = UIColor.green
                    clickedButton()
                }
            }else
            
            if userChoice1 == "#" && userChoice2 != "#" {
                if userChoice2 == choiceD{
                    self.userChoice2 = "#"
                    self.answerDBtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 != choiceD{
                    self.userChoice1 = choiceD
                    self.answerDBtn.backgroundColor = UIColor.green
                    clickedButton()
                }
            }
            else
            if userChoice1 != "#" && userChoice2 != "#" {
                if userChoice1 == choiceD{
                    self.userChoice1 = "#"
                    self.answerDBtn.backgroundColor = colors[0]
                    clickedButton()
                }else
                
                if userChoice2 == choiceD{
                    self.userChoice2 = "#"
                    self.answerDBtn.backgroundColor = colors[0]
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
                print("Betul")
            }
        }else
        if checkTotalBlank() == 2 {
            if ((self.userChoice1 == answerFill1) && (self.userChoice2 == answerFill2)){
                answer = true
                print("Betul")
            }
        }
        return answer
    }
    
    func rightAnswer(){
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertStarVC") as! AlertStarVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
        print("War biasa")
        //reloadChallenge()
    }
    
    func wrongAnswer(){
        self.failedNotification1Lbl.isHidden = false
        self.failedNotification2Lbl.isHidden = false
        if answerABtn.backgroundColor == UIColor.green {
            answerABtn.backgroundColor = UIColor.red
        }
        if answerBBtn.backgroundColor == UIColor.green {
            answerBBtn.backgroundColor = UIColor.red
        }
        if answerCBtn.backgroundColor == UIColor.green {
            answerCBtn.backgroundColor = UIColor.red
        }
        if answerDBtn.backgroundColor == UIColor.green {
            answerDBtn.backgroundColor = UIColor.red
        }
        print("Salah")
    }
    
    func insertAnswerToChat() {
          

          let indexPath = IndexPath(row: chatChallenges.count + 1, section: 1)
        
          messageTableView.beginUpdates()
          messageTableView.insertRows(at: [indexPath], with: .automatic)
          messageTableView.endUpdates()

          selfChatLbl.text = ""
          view.endEditing(true)
      }
    
    @IBAction func didTapSubmitButton(_ sender: Any) {
           if checkAnswer() == true{
               rightAnswer()
               //insertAnswerToChat()
                
           }else if checkAnswer() == false{
               wrongAnswer()
           }
       }
    
    
    
    
    @IBAction func diRdTapCloseBtn(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
        
    }
    

}

extension ChallengeObrolanVC: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatChallenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if (indexPath.row % 2 == 0){
            let message = chatChallenges[indexPath.row]
            let cell2 = tableView.dequeueReusableCell(withIdentifier: LeftMessage.cellID) as! LeftMessage
            cell2.messageLeftLabel.text = message.opponentChatText
            cell2.messageLeftSecondaryLabel.text = message.opponentChatTextIndo
            
            return cell2
            //cell2.messageLeftLabel.text = message.selfChatTextIndo
        } else {
            let message = chatChallenges[indexPath.row - 1]
            let cell1 = tableView.dequeueReusableCell(withIdentifier: RightMessage.cellID) as! RightMessage
            cell1.messageRightLabel.text = message.selfChatTextIndo
            cell1.messageRightSecondaryLabrl.text = message.selfChatTextIndo
            return cell1
        }
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.row == chatChallenges.count {
//            let message = chatChallenges[indexPath.row]
//            let aCell = tableView.dequeueReusableCell(withIdentifier: RightMessage.cellID, for: indexPath) as! RightMessage
//            aCell.messageRightLabel.text = message.opponentChatText
//            return aCell
//        }
//
//        let  bCell = tableView.dequeueReusableCell(withIdentifier: LeftMessage.cellID, for: indexPath) as! LeftMessage
//        bCell.messageLeftLabel.text = chatChallenges[indexPath.row].selfChatTextIndo
//        return bCell
//    }
    
    
    
    
}
