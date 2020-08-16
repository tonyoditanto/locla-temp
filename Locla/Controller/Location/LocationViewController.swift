//
//  LocationViewController.swift
//  Locla
//
//  Created by Edward da Costa on 17/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    
    var locationId : Int?
    var location : [Location] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLocation()

        // Do any additional setup after loading the view.
    }
    
    func fetchLocation (){
         location = DataLoader.getAllLocation()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        cell.locationLbl.text = location[indexPath.row].name
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
