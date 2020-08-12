//
//  DialogListeningVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class DialogListeningVC: UIViewController {

    @IBOutlet weak var judulSubtopikLabel: UILabel!
    @IBOutlet weak var subtopikImageView: UIImageView!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var mulaiButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureImage()
        configureLabel()
        // Do any additional setup after loading the view.
    }
    

    func configureButton(){
        self.mulaiButton.layer.cornerRadius = 10.0
        self.hintButton.layer.cornerRadius = 30.0
    }
    
    func configureLabel(){
        judulSubtopikLabel.text = "Siapa Aku? Siapa Dia?"
    }
    
    func configureImage(){
        subtopikImageView.image = UIImage(named: "people1")
    }

    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
}
