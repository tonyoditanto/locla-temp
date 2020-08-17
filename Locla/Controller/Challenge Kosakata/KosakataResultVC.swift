//
//  KosakataResultVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class KosakataResultVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var subtopik : Subtopic!
    var vocabularies : [Vocabulary] = []
    @IBOutlet weak var subtopikImageview: UIImageView!
    @IBOutlet weak var keteranganIndoLabel: UILabel!
    @IBOutlet weak var keteranganLocalLabel: UILabel!
    @IBOutlet weak var star1Imageview: UIImageView!
    @IBOutlet weak var star2Imageview: UIImageView!
    @IBOutlet weak var star3Imageview: UIImageView!
    @IBOutlet weak var jempolImageview: UIImageView!
    @IBOutlet weak var percobaanPertamaLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var randomTipLabel: UILabel!
    @IBOutlet weak var selesaiButton: UIButton!
    @IBOutlet weak var randomTipView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        configureLabel()
        configureButton()
        configureCollectionView()
        fetchListKosakata()
        // Do any additional setup after loading the view.
    }
    
    func fetchListKosakata(){
        self.vocabularies = DataLoader.getVocabularies(subtopicID: subtopik?.id ?? 1)
        //self.vocabularies = DataLoader.getVocabularies(subtopicID: subtopikId ?? 1)
        //self.subtopik = DataLoader.getSubtopic(subtopicID: subtopikId)
    }
    
    func configureImage(){
        self.subtopikImageview.image = UIImage(named: "people1")
        self.star1Imageview.image = UIImage(named: "star")
        self.star2Imageview.image = UIImage(named: "star")
        self.star3Imageview.image = UIImage(named: "star")
        self.jempolImageview.image = UIImage(named: "Image-1")
    }
    
    func configureLabel(){
        self.keteranganIndoLabel.text = "Kamu yang terbaik!!"
        self.keteranganLocalLabel.text = "Kon Sangar"
        self.percobaanPertamaLabel.text = "5/5"
        self.randomTipView.layer.cornerRadius = 10.0
    }
    
    func configureButton(){
        self.selesaiButton.layer.cornerRadius = 10.0
    }
    
    func configureCollectionView(){
        registerCollectionView()
    }
    
    func registerCollectionView(){
        let nib = UINib(nibName: NewWordsCollectionViewCell.cellID, bundle: Bundle.main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: NewWordsCollectionViewCell.cellID)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vocabularies.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewWordsCollectionViewCell.cellID, for: indexPath) as! NewWordsCollectionViewCell
        cell.newWordLabel.text = vocabularies[indexPath.row].word
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //performSegue(withIdentifier: "showResult", sender: indexPath)
    }
    
    @IBAction func didTapSelesaiButton(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
