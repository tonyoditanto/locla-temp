//
//  SubtopikVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SubtopikVC: UIViewController{

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var starLbl: UILabel!
    
    var topicId : Int?
    var subtopics : [Subtopic] = []
    
    var titleText, star : String?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = titleText
        starLbl.text = star
        fetchSubtopiks()
        setupCollectionView()
    }
      
    func fetchSubtopiks(){
        subtopics = DataLoader.getSubtopics(topicID: topicId ?? 1)
    }
      
    func setupCollectionView() {
        registerCollectionView()
    }
      
    func registerCollectionView(){
        let nib = UINib(nibName: SubtopikCollectionViewCell.cellID, bundle: Bundle.main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: SubtopikCollectionViewCell.cellID)
    }
      
}
  // MARK: UICollectionViewDataSource
extension SubtopikVC: UICollectionViewDelegate, UICollectionViewDataSource {
          
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subtopics.count
    }
          
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubtopikCollectionViewCell.cellID, for: indexPath) as? SubtopikCollectionViewCell else { return UICollectionViewCell() }
        cell.judulSubtopikLabel.text = subtopics[indexPath.row].name
        cell.jenisChallengeLabel.text = subtopics[indexPath.row].challengeType?.rawValue
        cell.raihanBintangLabel.text = "\(subtopics[indexPath.row].starGained) / \(subtopics[indexPath.row].totalStar)"
        cell.container.backgroundColor = subtopics[indexPath.row].status == Status.unlocked ? .systemOrange : .systemGray
        return cell
    }
          
          
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        performSegue(withIdentifier: "showSubtopik", sender: indexPath)
    }

          
  // MARK: - Sent Data to other ViewController
  //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //
  //    }
}
