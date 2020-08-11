//
//  LessonVC.swift
//  Locla
//
//  Created by Rizal Hidayat on 04/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class LessonVC: UIViewController{
    var locationId : Int?
    var topics : [Topic] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTopics()
        setupCollectionView()
    }
    
    func fetchTopics(){
        topics = DataLoader.getTopics(locationID: locationId ?? 1)
    }
    
    func setupCollectionView() {
        registerCollectionView()
    }
    
    func registerCollectionView(){
        let nib = UINib(nibName: TopikCollectionViewCell.cellID, bundle: Bundle.main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: TopikCollectionViewCell.cellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TopicToSubtopic" {
            guard let subtopicVC = segue.destination as? SubtopikVC,
                let index = sender as? Int
                else {
                    return
            }
            subtopicVC.topicId = topics[index].id
        }
    }
    
}

extension LessonVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopikCollectionViewCell.cellID, for: indexPath) as? TopikCollectionViewCell else { return UICollectionViewCell() }
        cell.judulTopikLabel.text = topics[indexPath.row].name
        cell.topikImageView.image = UIImage(named: topics[indexPath.row].imageFilename ?? "person2")
        let subtopics = DataLoader.getSubtopics(topicID: topics[indexPath.row].id ?? 1)
        cell.jumlahSubtopikLabel.text = "\(subtopics.count) Topik"
        var stargained = 0
        for subtopic in subtopics {
            stargained += subtopic.starGained ?? 0
        }
        cell.raihanBintangLabel.text = "\(stargained)"
        return cell
    }
        
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "TopicToSubtopic", sender: indexPath.row)
    }


}


