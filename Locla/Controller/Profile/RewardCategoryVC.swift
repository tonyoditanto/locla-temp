//
//  RewardViewController.swift
//  Locla
//
//  Created by Edward da Costa on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RewardCategoryVC: UICollectionViewController{
    
    var starGained : Int?
    var rewardCategories : [RewardCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRewardCategories()
    }
    
    func getRewardCategories(){
        rewardCategories = DataLoader.getRewardCategories()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rewardCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         collectionView.deselectItem(at: indexPath, animated: false)
        performSegue(withIdentifier: "RewardCategoryToReward", sender: indexPath.row)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardCategoryCell", for: indexPath) as! RewardCategoryCollectionViewCell
        cell.rewardCategoryLbl.text = rewardCategories[indexPath.row].name
        cell.starLbl.text = "\(rewardCategories[indexPath.row].requiredStar)"
        cell.backgroundColor = (rewardCategories[indexPath.row].requiredStar <= starGained ?? 0) ? .systemOrange : .systemGray
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RewardCategoryToReward" {
            guard let rewardVC = segue.destination as? RewardVC,
                let index = sender as? Int else { return }
            rewardVC.categoryId = rewardCategories[index].id
            rewardVC.title = rewardCategories[index].name
        }
    }
}
