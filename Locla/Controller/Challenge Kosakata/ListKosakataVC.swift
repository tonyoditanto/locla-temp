//
//  ListKosakataVC.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ListKosakataVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mulaiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    
    func configureButton(){
        self.mulaiButton.layer.cornerRadius = 10.0
    }

    func configureTableView(){
        registerTableView()
    }
    
    func registerTableView(){
        let nib = UINib(nibName: ListKosakataTableViewCell.cellID, bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: ListKosakataTableViewCell.cellID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListKosakataTableViewCell.cellID, for: indexPath) as! ListKosakataTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "showResult", sender: indexPath)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        let alertVC = UIStoryboard(name: "CustomAlert", bundle: nil).instantiateViewController(withIdentifier: "AlertExitVC") as! AlertExitVC
        
        alertVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(alertVC)
        self.view.addSubview(alertVC.view)
    }
    
}
