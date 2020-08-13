//
//  ProfileVC.swift
//  Locla
//
//  Created by Rizal Hidayat on 04/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import Foundation


class ProfileVC: UIViewController {
    
    @IBOutlet weak var userPV: UIProgressView!
    @IBOutlet weak var profilIV: UIImageView!
    @IBOutlet weak var bintang: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var totalStarLbl: UILabel!
    @IBOutlet weak var firstTryLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var percentageLbl: UILabel!
    
    var totalPercobaanPertama : Int?
    var totalstar : Int?
    var topics : [Topic] = []
    var locationId : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
         fetchTopics()
        setProgressLearning()
       
        getStar()
    }
    
    func setupView(){
        profilIV.layer.borderWidth = 4.0
        profilIV.layer.borderColor = #colorLiteral(red: 0.9818729758, green: 0.6061103344, blue: 0.01341408864, alpha: 1)
        profilIV.layer.cornerRadius = profilIV.frame.size.width / 2
    }
    
    func fetchTopics(){
        topics = DataLoader.getTopics(locationID: locationId ?? 1)
    }
    
    func getStar (){
        var subtopics : [Subtopic] = []
        for topic in topics {
            subtopics.append(contentsOf: DataLoader.getSubtopics(topicID: topic.id))
        }
        var stargained = 0
        for subtopic in subtopics {
            stargained += subtopic.starGained
        }
        if stargained == 0 {
            totalStarLbl.text = "0"
            print (stargained)
        }
        else {
            totalStarLbl.text = "\(stargained)"
        }
        
    }
    
    func getPercobaanPertama () {
        
    }
    
    @IBAction func onRenameBtnClicked(_ sender: UIButton) {
        //pop up alert rename
        let alertController = UIAlertController(title: "Change name", message: "Input your name", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Name"
        }
        
        
        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let inputName = alertController.textFields![0].text
            self.nameLbl.text = inputName
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func onRewardBtnClicked(_ sender: Any) {
    }
    
    func setProgressLearning() {
        var subtopics : [Subtopic] = []
        for topic in topics {
            subtopics.append(contentsOf: DataLoader.getSubtopics(topicID: topic.id))
        }
        let unlockedSubtopics = subtopics.filter{ $0.status == Status.cleared}
        userPV.progress = Float(unlockedSubtopics.count) / Float(subtopics.count)
        print(userPV.progress)
        percentageLbl.text = "\(Int((userPV.progress * 100).rounded())) % "
        
    }
    
    
    
    
    
}
