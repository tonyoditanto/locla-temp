//
//  ChallengeKosakataVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import AVFoundation

class ChallengeKosakataVC: UIViewController {
    
    var colors : [UIColor] = [#colorLiteral(red: 0.9764705882, green: 0.6156862745, blue: 0.01176470588, alpha: 1),#colorLiteral(red: 0.3098039216, green: 0.4196078431, blue: 0.862745098, alpha: 1),#colorLiteral(red: 0.5215686275, green: 0.368627451, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1),#colorLiteral(red: 0.5568627451, green: 0.7490196078, blue: 0.4039215686, alpha: 1),#colorLiteral(red: 0.4901960784, green: 0.1411764706, blue: 0.2274509804, alpha: 1)]
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
    var answer = ""
    var pertanyaan = ""
    var choiceA = ""
    var choiceB = ""
    var choiceC = ""
    var choiceD = ""
    var player : AVAudioPlayer?
    var petunjuk : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchChallenge()
        configureButton()
        configureLabel()
        configureAnswer()
        configureProgressView()
        configureViewInputUser()
        // Do any additional setup after loading the view.
    }
    
    func fetchChallenge(){
        self.challenge = DataLoader.getVocabularyChallenges(subtopicID: 1)
        self.totalQuestion = challenge.count
        self.answer = (self.challenge[currentQuestion-1].answer ?? Answer(rawValue: ""))!.rawValue
        self.pertanyaan = self.challenge[currentQuestion-1].question ?? ""
        self.choiceA = self.challenge[currentQuestion-1].optionA ?? ""
        self.choiceB = self.challenge[currentQuestion-1].optionB ?? ""
        self.choiceC = self.challenge[currentQuestion-1].optionC ?? ""
        self.choiceD = self.challenge[currentQuestion-1].optionD ?? ""
        
    }
    
    func configureButton(){
        self.petunjukButton.layer.cornerRadius = 30.0
        self.buttonA.layer.cornerRadius = 10.0
        self.buttonB.layer.cornerRadius = 10.0
        self.buttonC.layer.cornerRadius = 10.0
        self.buttonD.layer.cornerRadius = 10.0
        self.buttonA.backgroundColor = colors[0]
        self.buttonB.backgroundColor = colors[0]
        self.buttonC.backgroundColor = colors[0]
        self.buttonD.backgroundColor = colors[0]
    }
    
    func configureLabel(){
        self.pertanyaanLabel.text = self.pertanyaan
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
        self.progressView.progress = Float(currentQuestion) / Float(totalQuestion)
    }
    
    func configureViewInputUser(){
        self.viewInputUser.layer.cornerRadius = 50.0
    }
    
    @IBAction func didTapButtonA(_ sender: Any) {
        self.buttonA.backgroundColor = UIColor.green
        if "A" == answer{
            self.buttonA.backgroundColor = UIColor.green
            self.buttonB.backgroundColor = colors[0]
            self.buttonC.backgroundColor = colors[0]
            self.buttonD.backgroundColor = colors[0]
            rightAnswer()
        }
        
        if "A" != answer{
            self.buttonA.backgroundColor = UIColor.red
            self.buttonB.backgroundColor = colors[0]
            self.buttonC.backgroundColor = colors[0]
            self.buttonD.backgroundColor = colors[0]
            wrongAnswer()
        }
    }
    
    
    @IBAction func didTapButtonB(_ sender: Any) {
        self.buttonB.backgroundColor = UIColor.green
        if "B" == answer{
            self.buttonB.backgroundColor = UIColor.green
            self.buttonA.backgroundColor = colors[0]
            self.buttonC.backgroundColor = colors[0]
            self.buttonD.backgroundColor = colors[0]
            rightAnswer()
        }
        
        if "B" != answer{
            self.buttonA.backgroundColor = colors[0]
            self.buttonB.backgroundColor = UIColor.red
            self.buttonC.backgroundColor = colors[0]
            self.buttonD.backgroundColor = colors[0]
            wrongAnswer()
        }
    }
    
    @IBAction func didTapButtonC(_ sender: Any) {
        self.buttonC.backgroundColor = UIColor.green
        if "C" == answer{
            self.buttonC.backgroundColor = UIColor.green
            self.buttonA.backgroundColor = colors[0]
            self.buttonB.backgroundColor = colors[0]
            self.buttonD.backgroundColor = colors[0]
            rightAnswer()
        }
        
        if "C" != answer{
            self.buttonA.backgroundColor = colors[0]
            self.buttonB.backgroundColor = colors[0]
            self.buttonC.backgroundColor = UIColor.red
            self.buttonD.backgroundColor = colors[0]
            wrongAnswer()
        }
    }
    
    @IBAction func didTapButtonD(_ sender: Any) {
        self.buttonD.backgroundColor = UIColor.green
        if "D" == answer{
            self.buttonD.backgroundColor = UIColor.green
            self.buttonA.backgroundColor = colors[0]
            self.buttonB.backgroundColor = colors[0]
            self.buttonC.backgroundColor = colors[0]
            rightAnswer()
        }
        
        if "D" != answer{
            self.buttonA.backgroundColor = colors[0]
            self.buttonB.backgroundColor = colors[0]
            self.buttonC.backgroundColor = colors[0]
            self.buttonD.backgroundColor = UIColor.red
            wrongAnswer()
        }
    }
    
    func rightAnswer(){
        self.currentQuestion += 1
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertStarVC") as! AlertStarVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        alertVC.delegate = self
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
    func wrongAnswer(){
        self.keterangan1Label.isHidden = false
        self.keterangan2Label.isHidden = false
    }
    
    @IBAction func didTapPetunjukButton(_ sender: Any) {
        //Petunjuk.playPetunjuk(petunjukName: (self.challenge[currentQuestion-1].clueSoundFilename) ?? "")
        petunjuk = self.challenge[currentQuestion-1].clueSoundFilename ?? "Teman_SBY"
        let petunjukURL = Bundle.main.url(forResource: petunjuk, withExtension: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: petunjukURL!)
        } catch {
            print(error)
        }
        
        player?.play()
    }
    
//    func playPetunjuk(petunjukName : String){
//        let petunjukURL = Bundle.main.url(forResource: petunjukName, withExtension: "mp3")
//
//        do {
//            try player = AVAudioPlayer(contentsOf: petunjukURL!)
//        } catch {
//            print(error)
//        }
//
//        player?.play()
//    }
    
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}

extension ChallengeKosakataVC : AlertStarVCDelegate{
    
    func reload(){
        if currentQuestion <= totalQuestion {
            //self.currentQuestion += 1
            fetchChallenge()
            configureButton()
            configureLabel()
            configureAnswer()
            configureProgressView()
            configureViewInputUser()
        }

        if currentQuestion > totalQuestion {
            let storyboard = UIStoryboard(name: "Kosakata", bundle: nil)
            let destination = storyboard.instantiateViewController(identifier: "KosakataResultVC") as! KosakataResultVC
            destination.modalPresentationStyle = .fullScreen
            destination.modalTransitionStyle = .crossDissolve
            destination.subtopik = self.subtopik
            self.present(destination, animated: true, completion: nil)
        }
    }
}
