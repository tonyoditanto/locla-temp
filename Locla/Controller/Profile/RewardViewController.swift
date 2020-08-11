//
//  RewardViewController.swift
//  Locla
//
//  Created by Edward da Costa on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var ListRewardArray : [ListReward] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //List Reward array
        ListRewardArray.append(ListReward(name :"Rekomendasi Tempat Liburan"))
        ListRewardArray.append(ListReward(name :"Fun fact Surabaya"))
        ListRewardArray.append(ListReward(name :"Explicit Content"))
        ListRewardArray.append(ListReward(name :"Itinery Liburan di Jawa Timur"))
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return ListRewardArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "RewardTableViewCell", for: indexPath) as! RewardTableViewCell
     cell.textReward.text = ListRewardArray[indexPath.row].name
      return cell
     }
 
    
    @IBOutlet weak var tableView: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
class ListReward {
    var name = ""
       var checked = false
       
       convenience init(name: String){
           self.init()
           self.name = name
}
}
