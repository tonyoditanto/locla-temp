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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vocabDetailTableView.delegate = self
        vocabDetailTableView.dataSource = self
       
    }
}

extension VocabularyDetailVC: UITableViewDataSource, UITableViewDelegate,UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vocabCategoryDetailsCell", for: indexPath) as! vocabCategoryDetailsCell
        //cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
     
}
