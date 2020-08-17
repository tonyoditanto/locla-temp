//
//  IntroListeningVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class IntroListeningVC: UIViewController {

    @IBOutlet weak var judulSubtopikLabel: UILabel!
    @IBOutlet weak var subtopikImageView: UIImageView!
    @IBOutlet weak var deskripsiLabel: UILabel!
    @IBOutlet weak var misiLabel: UILabel!
    @IBOutlet weak var mulaiButton: UIButton!
    var subtopik : Subtopic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureImage()
        configureLabel()
    }
        
    func configureButton(){
        self.mulaiButton.layer.cornerRadius = 10.0
    }
        
    func configureLabel(){
        judulSubtopikLabel.text = "Siapa Aku? Siapa Dia?"
        deskripsiLabel.text = "Kamu sudah tahu sapaan orang-orang disekitarmu. Namun mereka menertawakanmu karena dialegmu yang unik dan berbeda, karenanya kamu mencoba nongkrong dengan warga sekitar"
        misiLabel.text = "Dengarkanlah percakapan warga setempat dan tantanglah dirimu dengan kuis"
    }
        
    func configureImage(){
        subtopikImageView.image = UIImage(named: "people1")
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        //let alertVC = self.storyboard?.instantiateViewController(withIdentifier: "AlertExitViewController") as! AlertExitViewController
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    

}
