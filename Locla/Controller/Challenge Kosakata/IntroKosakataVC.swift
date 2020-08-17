//
//  IntroKosakataVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class IntroKosakataVC: UIViewController {
    
    var subtopik : Subtopic!

    @IBOutlet weak var judulSubtopikLabel: UILabel!
    @IBOutlet weak var subtopikImageview: UIImageView!
    @IBOutlet weak var deskripsiLabel: UILabel!
    @IBOutlet weak var misiLabel: UILabel!
    @IBOutlet weak var mulaiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureLabel()
        configureImage()
        // Do any additional setup after loading the view.
    }
    
    func configureButton(){
        self.mulaiButton.layer.cornerRadius = 10.0
    }

    func configureLabel(){
        self.judulSubtopikLabel.text = subtopik.name ?? ""
        self.deskripsiLabel.text = subtopik.subtopicDescription ?? ""
        self.misiLabel.text = subtopik.mission ?? ""
    }
    
    func configureImage(){
        self.subtopikImageview.image = UIImage(named: "people1")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IntroToChallengeVocab" {
            guard let ChallengeKosakataVC = segue.destination as? ChallengeKosakataVC
                else {
                    return
            }
            ChallengeKosakataVC.subtopik = self.subtopik
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
