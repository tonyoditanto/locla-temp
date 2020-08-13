//
//  IntroObrolanVC.swift
//  Locla
//
//  Created by Bagus setiawan on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class IntroObrolanVC: UIViewController {
    
    @IBOutlet weak var judulSubtopicLbl: UILabel!
    @IBOutlet weak var subtopicIV: UIImageView!
    @IBOutlet weak var deskripsiLbl: UILabel!
    @IBOutlet weak var misiLbl: UILabel!
    @IBOutlet weak var mulaiBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureButton()
        configureLabel()
        configureImage()
    }
    

   func configureButton(){
        self.mulaiBtn.layer.cornerRadius = 10.0
    }
        
    func configureLabel(){
        judulSubtopicLbl.text = "Siapa Aku? Siapa Dia?"
        deskripsiLbl.text = "Kamu sudah tahu sapaan orang-orang disekitarmu. Namun mereka menertawakanmu karena dialegmu yang unik dan berbeda, karenanya kamu mencoba nongkrong dengan warga sekitar"
        misiLbl.text = "Dengarkanlah percakapan warga setempat dan tantanglah dirimu dengan kuis"
    }
        
    func configureImage(){
         subtopicIV.image = UIImage(named: "people1")
    }
    
    @IBAction func didCloseBtn(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
        
    }
    

}
