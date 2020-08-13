//
//  AlertStarVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AlertStarVC: UIViewController {

    @IBOutlet weak var star1Imageview: UIImageView!
    @IBOutlet weak var star2Imageview: UIImageView!
    @IBOutlet weak var star3Imageview: UIImageView!
    @IBOutlet weak var keteranganLabel: UILabel!
    @IBOutlet weak var keteranganImageview: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var lanjutButton: UIButton!
    @IBOutlet weak var customAlertView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureImageview()
        configureLabel()
        configureButton()
        // Do any additional setup after loading the view.
    }
    
    func configureBackground(){
        self.customAlertView.layer.cornerRadius = 20.0
    }
    
    func configureImageview(){
        self.star1Imageview.image = UIImage(named: "star")
        self.star2Imageview.image = UIImage(named: "star")
        self.star3Imageview.image = UIImage(named: "star")
        self.keteranganImageview.image = UIImage(named: "star")
    }
    
    func configureLabel(){
        self.keteranganLabel.text = "LUAR BIASA"
        self.tipLabel.text = "*Tip : Selain kon, kata ganti kamu bisa juga pakai kowe atau awakmu"
    }
    
    func configureButton(){
        self.lanjutButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func didTapLanjutButton(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
        self.parent?.view.reloadInputViews()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
