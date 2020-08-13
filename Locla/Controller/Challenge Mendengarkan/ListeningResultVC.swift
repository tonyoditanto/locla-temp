//
//  ListeningResultVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ListeningResultVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var subtopikImageview: UIImageView!
    @IBOutlet weak var resultIndoLabel: UILabel!
    @IBOutlet weak var resultLocalLabel: UILabel!
    @IBOutlet weak var star1Imageview: UIImageView!
    @IBOutlet weak var star2Imageview: UIImageView!
    @IBOutlet weak var star3Imageview: UIImageView!
    @IBOutlet weak var jempolImageview: UIImageView!
    @IBOutlet weak var percobaanPertamaLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var randomTipLabel: UILabel!
    @IBOutlet weak var selesaiButton: UIButton!
    @IBOutlet weak var viewRandomTip: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton()
        configureLabel()
        configureImage()
        configureCollectionView()
    }
    
    func configureButton(){
        self.selesaiButton.layer.cornerRadius = 10.0

    }
    
    func configureLabel(){
        self.resultIndoLabel.text = "Kamu yang terbaik!!"
        self.resultLocalLabel.text = "Kon sangar"
        self.randomTipLabel.text = "*Random Tip : Cok biasanya di gunakan kalau kondisi sudah akrab, jangan pada orang yang baru anda kenal"
        self.viewRandomTip.layer.cornerRadius = 10.0
        self.percobaanPertamaLabel.text = "5/5"
    }
    
    func configureImage(){
        self.subtopikImageview.image = UIImage(named: "people1")
        self.star1Imageview.image = UIImage(named: "star")
        self.star2Imageview.image = UIImage(named: "star")
        self.star3Imageview.image = UIImage(named: "star")
        self.jempolImageview.image = UIImage(named: "star")
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
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewWordsCollectionViewCell.cellID, for: indexPath) as! NewWordsCollectionViewCell
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
