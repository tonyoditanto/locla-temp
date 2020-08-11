//
//  VocabularyVC.swift
//  Locla
//
//  Created by Rizal Hidayat on 04/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class VocabularyVC: UIViewController, UISearchBarDelegate {


    @IBOutlet weak var categoryVocabCollectionView: UICollectionView!
    
    var colors : [UIColor] = [#colorLiteral(red: 0.9294117647, green: 0.6235294118, blue: 0.2235294118, alpha: 1),#colorLiteral(red: 0.3098039216, green: 0.4196078431, blue: 0.862745098, alpha: 1),#colorLiteral(red: 0.5215686275, green: 0.368627451, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1),#colorLiteral(red: 0.5568627451, green: 0.7490196078, blue: 0.4039215686, alpha: 1),#colorLiteral(red: 0.4901960784, green: 0.1411764706, blue: 0.2274509804, alpha: 1),#colorLiteral(red: 0.5215686275, green: 0.368627451, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.9294117647, green: 0.6235294118, blue: 0.2235294118, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1),#colorLiteral(red: 0.4901960784, green: 0.1411764706, blue: 0.2274509804, alpha: 1)]
    let searchController = UISearchController(searchResultsController: nil)
    let MyCollectionViewCellId: String = "vocabularyCategoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        categoryVocabCollectionView.register(nibCell,forCellWithReuseIdentifier: MyCollectionViewCellId)
        categoryVocabCollectionView.dataSource = self
        categoryVocabCollectionView.delegate = self
        setupSearchController()
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
    }
}


extension VocabularyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
       
        return UIEdgeInsets(top: CGFloat(10), left: CGFloat(20), bottom: CGFloat(10), right: CGFloat(20))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! vocabularyCategoryCell
        cell.backgroundColor = colors[indexPath.row]
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "vocabularyCategory", sender: indexPath)
        print("masuk\(indexPath.row)")
    }
    

}
