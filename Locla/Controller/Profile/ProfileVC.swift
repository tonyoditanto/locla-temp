//
//  ProfileVC.swift
//  Locla
//
//  Created by Rizal Hidayat on 04/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var buttonHadiah: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // backProfil = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backProfil.image = UIImage(named : "backgroundProfil")
        ProfilPic.image = UIImage(named: "people2")
        bintang.image = UIImage(named: "star")
        percobaanPertama.image = UIImage(named: "Image-1")
        bgBintang.layer.cornerRadius = 10
        bgPercobaanPertama.layer.cornerRadius = 10
        bgBintang.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 100)
        bgPercobaanPertama.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 100)
        imgHadiah.image = UIImage(named: "reward")
        buttonHadiah.backgroundColor = UIColor.init(red: 250/255, green: 120/255, blue: 0/255, alpha: 100)
        buttonHadiah.layer.cornerRadius = 10
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        
        //ProfilPic.layer.cornerRadius = 14
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonHadiah(_ sender: Any) {
    }
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imgHadiah: UIImageView!
    @IBOutlet weak var bgPercobaanPertama: UIImageView!
    @IBOutlet weak var bintang: UIImageView!
    @IBOutlet weak var percobaanPertama: UIImageView!
    @IBOutlet weak var backProfil: UIImageView!
    @IBOutlet weak var ProfilPic: UIImageView!
    @IBOutlet weak var bgBintang: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
