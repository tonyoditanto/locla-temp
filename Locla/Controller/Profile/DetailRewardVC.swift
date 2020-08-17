//
//  DetailRewardViewController.swift
//  Locla
//
//  Created by Rizal Hidayat on 17/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class DetailRewardVC: UIViewController {

    @IBOutlet weak var picIV: UIImageView!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    var reward : Reward?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        title = reward?.name
        picIV.image = UIImage(named: reward?.imageFilename ?? "")
        sourceLbl.text = reward?.imageSource
        descriptionLbl.text = reward?.detail
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
