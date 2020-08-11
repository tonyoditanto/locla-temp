//
//  RewardListViewController.swift
//  Locla
//
//  Created by Edward da Costa on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

     var DetailListRewardArray : [DetailListReward] = []
    
      override func viewDidLoad() {
          super.viewDidLoad()
          //List Reward array
        DetailListRewardArray.append(DetailListReward(name: "Kenjeran park", lokasi: "jalan X1"))
        DetailListRewardArray.append(DetailListReward(name: "Mangrove", lokasi: "jalan X2"))
        DetailListRewardArray.append(DetailListReward(name: "HouseOfSampoerna", lokasi: "jalanX3"))
          // Do any additional setup after loading the view.
      }

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return DetailListRewardArray.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRewardTableViewCell", for: indexPath) as! RewardListTableViewCell
    cell.namaReward.text = DetailListRewardArray[indexPath.row].name
    
    cell.lokasiReward.text = DetailListRewardArray[indexPath.row].lokasi
    
              
    return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailRewardViewController")as? DetailRewardViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }

        
    }
   
}
class DetailListReward {
    var name = ""
    var lokasi = ""
       var checked = false
       
    convenience init(name: String, lokasi: String){
           self.init()
           self.name = name
    self.lokasi = lokasi
}
}

