//
//  SubtopikVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SubtopikVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSubtopiks()
        setupCollectionView()
    }
      
    func fetchSubtopiks(){
    }
      
    func setupCollectionView() {
        registerCollectionView()
    }
      
    func registerCollectionView(){
        let nib = UINib(nibName: SubtopikCollectionViewCell.cellID, bundle: Bundle.main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: SubtopikCollectionViewCell.cellID)
    }
      
  // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
          
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
          
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubtopikCollectionViewCell.cellID, for: indexPath) as! SubtopikCollectionViewCell
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
