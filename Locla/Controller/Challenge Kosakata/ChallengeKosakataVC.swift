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
    
    var answer : String = "konco"
    var totalQuestion : Int = 2
    var currentQuestion : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureLabel()
        configureAnswer()
        configureProgressView()
        configureViewInputUser()
        checkAnswer()
        // Do any additional setup after loading the view.
    }
    
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
        self.buttonA.setTitle("konci", for: .normal)
        self.buttonB.setTitle("konco", for: .normal)
        self.buttonC.setTitle("konca", for: .normal)
        self.buttonD.setTitle("koncu", for: .normal)
    }
    
    func configureProgressView(){
        self.progressView.layer.cornerRadius = 10.0
        self.progressView.layer.masksToBounds = true
        self.progressViewLabel.text = "\(currentQuestion)/\(totalQuestion)"
        //self.progressViewLabel.text = "01/10"
    }
    
    func configureViewInputUser(){
        self.viewInputUser.layer.cornerRadius = 50.0
    }
    
    func checkAnswer(){
        
    }
    
    @IBAction func didTapButtonA(_ sender: Any) {
        if buttonA.titleLabel?.text == answer{
            rightAnswer()
        }
        
        if buttonA.titleLabel?.text != answer{
            wrongAnswer()
        }
    }
    
    
    @IBAction func didTapButtonB(_ sender: Any) {
        if buttonB.titleLabel?.text == answer{
            rightAnswer()
        }
        
        if buttonB.titleLabel?.text != answer{
            wrongAnswer()
        }
    }
    
    @IBAction func didTapButtonC(_ sender: Any) {
        if buttonC.titleLabel?.text == answer{
            rightAnswer()
        }
        
        if buttonC.titleLabel?.text != answer{
            wrongAnswer()
        }
    }
    
    @IBAction func didTapButtonD(_ sender: Any) {
        if buttonD.titleLabel?.text == answer{
            rightAnswer()
        }
        
        if buttonD.titleLabel?.text != answer{
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
    
    func reloadChallenge(){
        if self.currentQuestion <= self.totalQuestion {
            self.currentQuestion += 1
            self.progressViewLabel.text = "\(currentQuestion)/\(totalQuestion)"
            self.pertanyaanLabel.text = "Apa bahasa surabaya dari “Teman”?"
            self.buttonA.setTitle("konci", for: .normal)
            self.buttonB.setTitle("konco", for: .normal)
            self.buttonC.setTitle("konca", for: .normal)
            self.buttonD.setTitle("koncu", for: .normal)
        }
        
        if self.currentQuestion > self.totalQuestion {
            let storyboard = UIStoryboard(name: "Kosakata", bundle: nil)
            let destination = storyboard.instantiateViewController(identifier: "KosakataResultVC") as! KosakataResultVC
            destination.modalPresentationStyle = .fullScreen
            destination.modalTransitionStyle = .crossDissolve
            self.present(destination, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
