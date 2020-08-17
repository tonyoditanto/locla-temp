//
//  RewardVC.swift
//  Locla
//
//  Created by Rizal Hidayat on 15/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RewardCell"

class RewardVC: UICollectionViewController {
    var locationId : Int?
    var categoryId : Int?
    var rewards : [Reward] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRewards()
    }
    
    func getRewards(){
        //ubah nanti location
        rewards = DataLoader.getRewards(locationID: 1, categoryID: categoryId ?? 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RewardToDetailReward" {
            guard let detailVC = segue.destination as? DetailRewardVC,
                let index = sender as? Int else { return }
            detailVC.reward = rewards[index]
        }
        
    }
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return rewards.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? RewardCollectionViewCell else { return UICollectionViewCell()}
        cell.nameLbl.text = rewards[indexPath.row].name
        cell.rewardIV.image = UIImage(named: rewards[indexPath.row].imageFilename ?? "")
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        performSegue(withIdentifier: "RewardToDetailReward", sender: indexPath.row)
    }
    
    
    
}
