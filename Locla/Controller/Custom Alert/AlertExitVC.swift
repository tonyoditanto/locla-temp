//
//  AlertExitVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AlertExitVC: UIViewController {

    @IBOutlet weak var alertImageview: UIImageView!
    @IBOutlet weak var lanjutButton: UIButton!
    @IBOutlet weak var keluarButton: UIButton!
    @IBOutlet weak var customAlertView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureImageview()
        configureButton()
    }
    
    func configureBackground(){
        self.customAlertView.layer.cornerRadius = 20.0
    }
    
    func configureImageview(){
        self.alertImageview.image = UIImage(named: "star")
    }
    
    func configureButton(){
        self.lanjutButton.layer.cornerRadius = 10.0
        self.keluarButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func didTapLanjutButton(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    
    @IBAction func didTapKeluarButton(_ sender: Any) {
        //parent?.dismiss(animated: true, completion: nil)
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
