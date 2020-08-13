//
//  IntroKosakataVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class IntroKosakataVC: UIViewController {

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
        self.judulSubtopikLabel.text = "Siapa Aku? Siapa Dia?"
        self.deskripsiLabel.text = "Kamu baru saja sampai di kota rantaumu namun kamu bingung bagaimana menyapa orang-orang disekitarmu"
        self.misiLabel.text = "Cobalah mengingat sapaan yang digunakan di daerah setempat dari halaman sebelum dan tantanglah dirimu dengan kuis"
    }
    
    func configureImage(){
        self.subtopikImageview.image = UIImage(named: "people2")
    }
    
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
