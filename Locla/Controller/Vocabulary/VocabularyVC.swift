//
//  VocabularyVC.swift
//  Locla
//
//  Created by Rizal Hidayat on 04/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class VocabularyVC: UIViewController {


    @IBOutlet weak var categoryVocabCollectionView: UICollectionView!
    
    var locationId : Int?
    var categoriID : Int?
    var vocabularyCategories : [VocabularyCategory] = []
    var searchBarVocabulary : [Vocabulary] = []
    var dataResult : [Vocabulary] = []
    
    var colors : [UIColor] = [#colorLiteral(red: 0.9294117647, green: 0.6235294118, blue: 0.2235294118, alpha: 1),#colorLiteral(red: 0.3098039216, green: 0.4196078431, blue: 0.862745098, alpha: 1),#colorLiteral(red: 0.5215686275, green: 0.368627451, blue: 0.8470588235, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1),#colorLiteral(red: 0.5568627451, green: 0.7490196078, blue: 0.4039215686, alpha: 1),#colorLiteral(red: 0.4901960784, green: 0.1411764706, blue: 0.2274509804, alpha: 1)]
    var searchController: UISearchController!
    
    private var searchBarVc : SearchBarVC!
    
    let MyCollectionViewCellId: String = "vocabularyCategoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        categoryVocabCollectionView.register(nibCell,forCellWithReuseIdentifier: MyCollectionViewCellId)
        categoryVocabCollectionView.dataSource = self
        categoryVocabCollectionView.delegate = self
        setupSearchController()
        fetchVocabCategory()
        fetchVocabularies()
        
    }
    
    func setupSearchController() {
        
        searchBarVc = storyboard?.instantiateViewController(withIdentifier: "SearchBarVC") as? SearchBarVC
        searchController = UISearchController(searchResultsController: searchBarVc)
        searchBarVc.dataResult = searchBarVocabulary
        searchBarVc.searchBarVocabulary = searchBarVocabulary
        searchController.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
    }
    
    func fetchVocabCategory(){
        vocabularyCategories = DataLoader.getVocabularyCategories(locationID: locationId ?? 1)
    }
    
    func fetchVocabularies(){
       dataResult = DataLoader.getVocabularies(categoryID: categoriID ?? 1)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "vocabularyToDetailCategory" {
               guard let vocabDetail = segue.destination as? VocabularyDetailVC,
                   let index = sender as? Int
                   else {
                       return
               }
            
            vocabDetail.navigationItem.title = vocabularyCategories[index].name
            vocabDetail.categoriID = vocabularyCategories[index].id
                
            }
        }
    }


extension VocabularyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vocabularyCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 40, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! vocabularyCategoryCell
        cell.backgroundColor = colors[indexPath.row]
        cell.categoryVocalLabel.text = vocabularyCategories[indexPath.row].name
        cell.categoryVocalImage.image = UIImage(named: vocabularyCategories[indexPath.row].imageFilename ?? "person2")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "vocabularyToDetailCategory", sender: indexPath.row)
        print("masuk\(indexPath.row)")
    }

}

extension VocabularyVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selected: Int) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
        
        if searchText.isEmpty {
            searchBarVocabulary = dataResult
        }else {
            searchBarVocabulary = dataResult.filter{searchBarVocabulary in (searchBarVocabulary.word?.lowercased().contains(searchText.lowercased()))! || ((searchBarVocabulary.meaning?.lowercased().contains(searchText.lowercased()))!)
            }
        }
        
        print(searchText)
        searchBarVc.dataResult = searchBarVocabulary
        searchBarVc.searchBarResultTableView.reloadData()
    }
    
    func searchButtonCliked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
    }
    
}

extension VocabularyVC : UISearchControllerDelegate{
    
    func search(_ searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
        
        if searchText.isEmpty {
            searchBarVocabulary = dataResult
        }else {
            searchBarVocabulary = dataResult.filter{searchBarVocabulary in (searchBarVocabulary.word?.lowercased().contains(searchText.lowercased()))! || ((searchBarVocabulary.meaning?.lowercased().contains(searchText.lowercased()))!)
            }
        }
            
        print(searchText)
        searchBarVc.dataResult = searchBarVocabulary
        searchBarVc.searchBarResultTableView.reloadData()
    }
}

