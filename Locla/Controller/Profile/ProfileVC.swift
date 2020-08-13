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

    @IBOutlet weak var hadiahBtn: UIButton!
       @IBOutlet weak var progressView: UIProgressView!
       @IBOutlet weak var imgHadiah: UIImageView!
       @IBOutlet weak var bgPercobaanPertama: UIImageView!
       @IBOutlet weak var bintang: UIImageView!
       @IBOutlet weak var percobaanPertama: UIImageView!
       @IBOutlet weak var backProfil: UIImageView!
       @IBOutlet weak var ProfilPic: UIImageView!
       @IBOutlet weak var bgBintang: UIImageView!
    @IBOutlet weak var lblBintang: UILabel!
    @IBOutlet weak var lblPercobaanPertama: UILabel!
    @IBOutlet weak var lblnama: UILabel!
    @IBOutlet weak var lblPV: UILabel!
    
    var totalPercobaanPertama : Int?
    var totalstar : Int?
    var topics : [Topic] = []
    var locationId : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressLearning()
        fetchTopics()
        bgBintang.layer.cornerRadius = 10
        bgPercobaanPertama.layer.cornerRadius = 10
        bgBintang.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 100)
        bgPercobaanPertama.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 100)
        hadiahBtn.backgroundColor = UIColor.init(red: 250/255, green: 120/255, blue: 0/255, alpha: 100)
        hadiahBtn.layer.cornerRadius = 10
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        getStar()
        //ProfilPic.layer.cornerRadius = 14
       
    
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
            lblBintang.text = "0"
           print (stargained)
        }
        else {
             lblBintang.text = "\(stargained)"
        }
       
    }
   
    func getPercobaanPertama () {
       
    }
        
    
    //rename
       @IBAction func renameButton(_ sender: Any) {
          //pop up alert rename
           let alertController = UIAlertController(title: "Welcome", message: "Input your Name", preferredStyle: .alert)

           alertController.addTextField { (textField) in
               // configure the properties of the text field
               textField.placeholder = "Name"
           }


           // add the buttons/actions to the view controller
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           let saveAction = UIAlertAction(title: "Save", style: .default) { _ in


               let inputName = alertController.textFields![0].text

               //print(inputName)
               self.lblnama.text = inputName
           }
           alertController.addAction(cancelAction)
           alertController.addAction(saveAction)

           present(alertController, animated: true, completion: nil)
          
       }
    @IBAction func buttonHadiah(_ sender: Any) {
    }
    

    var maxTime : Float = 10.0
    var currentTime : Float = 0
    
    @objc func updateProgress(){
        currentTime = currentTime + 1.1
           progressView.progress = currentTime/maxTime
       }
       
       @objc func decreaseProgress (){
           currentTime = currentTime - 1.1
           progressView.progress = currentTime/maxTime
       }
    func progressLearning() {
     
        
        if Status.unlocked.rawValue == "Unlocked" {
            perform(#selector(updateProgress))
            self.lblPV.text = "\(Int(self.progressView.progress * 100))%"
        }
        else {
            perform(#selector(decreaseProgress))
        }
        
    }
    
    
    
    
    
}
