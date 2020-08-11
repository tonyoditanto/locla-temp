//
//  DetailRewardViewController.swift
//  Locla
//
//  Created by Edward da Costa on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class DetailRewardViewController: UIViewController {

    @IBOutlet weak var descDetailReward: UILabel!
    @IBOutlet weak var lokasiDetailReward: UILabel!
    @IBOutlet weak var imgDetailReward: UIImageView!
    @IBOutlet weak var nameDetailReward: UILabel!
    
    @IBOutlet weak var source: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            imgDetailReward.layer.cornerRadius = 10
                  imgDetailReward.backgroundColor = UIColor.init(red: 250/255, green: 120/255, blue: 0/255, alpha: 100)
        descDetailReward.text = "ini deskripsi"
        nameDetailReward.text = "nama tempat"
        lokasiDetailReward.text = "lokasi tempat"
        source.text = "source dari image"
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


