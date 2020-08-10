//
//  RewardListViewController.swift
//  Locla
//
//  Created by Edward da Costa on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

     var DetailListRewardArray : [Reward] = []
    
      override func viewDidLoad() {
          super.viewDidLoad()
          //List Reward array
  let rewardmanager: RewardManager = RewardManager()
        DetailListRewardArray = rewardmanager.arrayOfReward
          // Do any additional setup after loading the view.
      }

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return DetailListRewardArray.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRewardTableViewCell", for: indexPath) as! RewardListTableViewCell
    let detaillistreward = DetailListRewardArray[indexPath.row]
    cell.namaReward.text = String(detaillistreward.name)
    cell.lokasiReward.text = String(detaillistreward.lokasi)
    cell.imgReward.image = UIImage(named: detaillistreward.imageRewardName)
    
              
    return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailRewardViewController")as? DetailRewardViewController{
            vc.detailReward = DetailListRewardArray[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
       /* vc?.nameDetailReward = DetailListRewardArray[indexPath.row].name
               vc?.lokasi = DetailListRewardArray[indexPath.row].lokasi
               vc?.imgReward = DetailListRewardArray[indexPath.row]
 */
        
    }
   
}


