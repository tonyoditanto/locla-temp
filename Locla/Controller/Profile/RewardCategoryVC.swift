//
//  RewardViewController.swift
//  Locla
//
//  Created by Edward da Costa on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardCategoryVC: UITableViewController{
    
    var starGained : Int?
    var rewardCategories : [RewardCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRewardCategories()
    }
    
    func getRewardCategories(){
        rewardCategories = DataLoader.getRewardCategories()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewardCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardCategoryCell", for: indexPath) as! RewardCategoryCell
        cell.rewardCategoryLbl.text = rewardCategories[indexPath.row].name
        cell.starLbl.text = "\(rewardCategories[indexPath.row].requiredStar)"
        cell.container.backgroundColor = (rewardCategories[indexPath.row].requiredStar <= starGained ?? 0) ? .systemOrange : .systemGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
