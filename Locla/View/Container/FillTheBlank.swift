//
//  FillTheBlank.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 13/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class FillTheBlank: UIView {

    @IBOutlet weak var keterangan1Label: UILabel!
    @IBOutlet weak var keterangan2Label: UILabel!
    @IBOutlet weak var fillTheBlankStack: UIStackView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var opsiAButton: UIButton!
    @IBOutlet weak var opsiBButton: UIButton!
    @IBOutlet weak var opsiCButton: UIButton!
    @IBOutlet weak var opsiDButton: UIButton!
    @IBOutlet weak var bgFillTheBlank: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureKeterangan()
        configureBackground()
        configureButton()
        configureAnswer()
        configureFillTheBlank()
        var label = UILabel()
        label.text = "test"
        fillTheBlankStack.addSubview(label)
    }
    
    func configureKeterangan(){
        self.keterangan1Label.isHidden = true
        self.keterangan2Label.isHidden = true
    }
    
    func configureBackground(){
        self.bgFillTheBlank.layer.cornerRadius = 50.0
        self.bgFillTheBlank.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configureButton(){
        self.submitButton.layer.cornerRadius = 20.0
        self.opsiAButton.layer.cornerRadius = 5.0
        self.opsiBButton.layer.cornerRadius = 5.0
        self.opsiCButton.layer.cornerRadius = 5.0
        self.opsiDButton.layer.cornerRadius = 5.0
    }
    
    func configureAnswer(){
        self.opsiAButton.setTitle("iso", for: .normal)
        self.opsiBButton.setTitle("sak", for: .normal)
        self.opsiCButton.setTitle("kon", for: .normal)
        self.opsiDButton.setTitle("pirosasasas", for: .normal)
    }
    
    func configureFillTheBlank(){
//        var pertanyaan : String = "blank1, nggak , blank2, boso jowo ta?"
//        let jawaban1 = "kon"
//        let jawaban2 = "iso"
//
//        var arrays = pertanyaan.components(separatedBy: ", ")
//        for array in arrays {
//            //print(array)
//            if array == "blank2" {
//                totalBlank = .blank2
//            }
//        }
//        print(arrays[0])
//
//        switch totalBlank {
//        case .blank1:
//            print()
//        case .blank2:
//        print()
//        default:
//            print()
//        }
    }

}
