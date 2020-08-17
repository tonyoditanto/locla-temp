//
//  ChallengeKosakataVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ChallengeKosakataVC: UIViewController {
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressViewLabel: UILabel!
    @IBOutlet weak var pertanyaanLabel: UILabel!
    @IBOutlet weak var petunjukButton: UIButton!
    @IBOutlet weak var keterangan1Label: UILabel!
    @IBOutlet weak var keterangan2Label: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var viewInputUser: UIView!
    
    var subtopik : Subtopic!
    var challenge = [VocabularyChallenge]()
    var challenge2 = [Subtopic]()
    var totalQuestion : Int = 0
    var currentQuestion : Int = 1
    var answer = "A"
    var pertanyaan = ""
    var choiceA = ""
    var choiceB = ""
    var choiceC = ""
    var choiceD = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchChallenge()
        configureButton()
        configureLabel()
        configureAnswer()
        configureProgressView()
        configureViewInputUser()
        checkAnswer()
        // Do any additional setup after loading the view.
    }
    
    func fetchChallenge(){
        self.challenge = DataLoader.getVocabularyChallenges(subtopicID: 1)
        self.challenge2 = DataLoader.getSubtopics(topicID: 1)
        self.totalQuestion = challenge.count
        print(challenge.count)
//        self.answer = (self.challenge[currentQuestion-1].answer ?? Answer(rawValue: ""))!.rawValue
//        self.pertanyaan = self.challenge[currentQuestion].question ?? ""
//        self.choiceA = self.challenge[currentQuestion].optionA ?? ""
//        self.choiceB = self.challenge[currentQuestion].optionB ?? ""
//        self.choiceC = self.challenge[currentQuestion].optionC ?? ""
//        self.choiceD = self.challenge[currentQuestion].optionD ?? ""
        
    }
    
    func reloadChallenge(){
        configureButton()
        configureLabel()
        configureAnswer()
        configureProgressView()
        configureViewInputUser()
        checkAnswer()
    }
    
//    func reloadChallenge(){
//        if self.currentQuestion <= self.totalQuestion {
//            self.currentQuestion += 1
//            self.progressViewLabel.text = "\(currentQuestion)/\(totalQuestion)"
//            self.pertanyaanLabel.text = "Apa bahasa surabaya dari “Teman”?"
//            self.buttonA.setTitle("konci", for: .normal)
//            self.buttonB.setTitle("konco", for: .normal)
//            self.buttonC.setTitle("konca", for: .normal)
//            self.buttonD.setTitle("koncu", for: .normal)
//        }
//
//        if self.currentQuestion > self.totalQuestion {
//            let storyboard = UIStoryboard(name: "Kosakata", bundle: nil)
//            let destination = storyboard.instantiateViewController(identifier: "KosakataResultVC") as! KosakataResultVC
//            destination.modalPresentationStyle = .fullScreen
//            destination.modalTransitionStyle = .crossDissolve
//            self.present(destination, animated: true, completion: nil)
//        }
//    }

    
    func configureButton(){
        self.petunjukButton.layer.cornerRadius = 30.0
        self.buttonA.layer.cornerRadius = 10.0
        self.buttonB.layer.cornerRadius = 10.0
        self.buttonC.layer.cornerRadius = 10.0
        self.buttonD.layer.cornerRadius = 10.0
    }
    
    func configureLabel(){
        self.pertanyaanLabel.text = "Apa bahasa surabaya dari “Teman”?"
        self.keterangan1Label.isHidden = true
        self.keterangan2Label.isHidden = true
    }
    
    func configureAnswer(){
        self.buttonA.setTitle(self.choiceA, for: .normal)
        self.buttonB.setTitle(self.choiceB, for: .normal)
        self.buttonC.setTitle(self.choiceC, for: .normal)
        self.buttonD.setTitle(self.choiceD, for: .normal)
    }
    
    func configureProgressView(){
        self.progressView.layer.cornerRadius = 10.0
        self.progressView.layer.masksToBounds = true
        self.progressViewLabel.text = "\(currentQuestion)/\(totalQuestion)"
        self.progressView.progress = Float(currentQuestion)
    }
    
    func configureViewInputUser(){
        self.viewInputUser.layer.cornerRadius = 50.0
    }
    
    func checkAnswer(){
        
    }
    
    @IBAction func didTapButtonA(_ sender: Any) {
        if "A" == answer{
            rightAnswer()
        }
        
        if "A" != answer{
            wrongAnswer()
        }
    }
    
    
    @IBAction func didTapButtonB(_ sender: Any) {
        if "B" == answer{
            rightAnswer()
        }
        
        if "B" != answer{
            wrongAnswer()
        }
    }
    
    @IBAction func didTapButtonC(_ sender: Any) {
        if "C" == answer{
            rightAnswer()
        }
        
        if "C" != answer{
            wrongAnswer()
        }
    }
    
    @IBAction func didTapButtonD(_ sender: Any) {
        if "D" == answer{
            rightAnswer()
        }
        
        if "D" != answer{
            wrongAnswer()
        }
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
    }
    
    @IBAction func didTapPetunjukButton(_ sender: Any) {
        
    }
    
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
