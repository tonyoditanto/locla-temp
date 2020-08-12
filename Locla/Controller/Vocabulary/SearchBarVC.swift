//
//  SearchBarVC.swift
//  Locla
//
//  Created by Bagus setiawan on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SearchBarVC: UIViewController {
    
    @IBOutlet weak var searchBarResultTableView: UITableView!
    
    var categoriID : Int?
    var searchBarVocabulary : [Vocabulary] = []
    var dataResult : [Vocabulary] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarResultTableView.delegate = self
        searchBarResultTableView.dataSource = self
        fetchVocabularies()
        
    }
    
    func fetchVocabularies(){
          dataResult = DataLoader.getVocabularies(categoryID: categoriID ?? 1)
       }

}

extension SearchBarVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarResultCell", for: indexPath) as! SearchBarResultCell
        cell.wordLabel.text = dataResult[indexPath.row].word
        cell.meaningLabel.text = dataResult[indexPath.row].meaning
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension SearchBarVC : UISearchControllerDelegate{
    
    func search(_ searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
        
        if searchText.isEmpty {
            searchBarVocabulary = dataResult
        }else {
            searchBarVocabulary = dataResult.filter{searchBarVocabulary in (searchBarVocabulary.word?.lowercased().contains(searchText.lowercased()))! || ((searchBarVocabulary.meaning?.lowercased().contains(searchText.lowercased()))!)
            }
        }
        print(searchText)
        dataResult = searchBarVocabulary
        searchBarResultTableView.reloadData()
    }
}
