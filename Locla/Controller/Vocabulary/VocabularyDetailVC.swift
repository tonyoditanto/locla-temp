//
//  VocabularyDetailVC.swift
//  Locla
//
//  Created by Bagus setiawan on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class VocabularyDetailVC: UIViewController {
    
    @IBOutlet weak var vocabDetailTableView: UITableView!
    
    var categoriID : Int?
    var vocabularies : [Vocabulary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vocabDetailTableView.delegate = self
        vocabDetailTableView.dataSource = self
        fetchVocabularies()
        
    }
    
    func fetchVocabularies(){
        vocabularies = DataLoader.getVocabularies(categoryID: categoriID ?? 1)
    }
}

extension VocabularyDetailVC: UITableViewDataSource, UITableViewDelegate,UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabularies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vocabCategoryDetailsCell", for: indexPath) as! VocabCategoryDetailsCell
        cell.word.text = vocabularies[indexPath.row].word
        cell.meaning.text = vocabularies[indexPath.row].meaning
        //self.title = vocabularies[indexPath.row].word
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
     
}
