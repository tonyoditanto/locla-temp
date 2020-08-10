//
//  DummyData.swift
//  Locla
//
//  Created by Bagus setiawan on 08/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

public struct categoryVocab {
    
    var nameCategory : String
    var imageCategory : UIImage
}

func fechDataCategoryVocab() -> [categoryVocab] {
    
    let dataCategoryVocab: [categoryVocab] =
    [
        categoryVocab (nameCategory: "Nama Ganti Orang", imageCategory: #imageLiteral(resourceName: "Domi")),
        categoryVocab (nameCategory: "Berbelanja", imageCategory: #imageLiteral(resourceName: "Domi")),
        categoryVocab (nameCategory: "Angka", imageCategory: #imageLiteral(resourceName: "Domi")),
        categoryVocab (nameCategory: "Hari", imageCategory: #imageLiteral(resourceName: "Domi")),
        categoryVocab (nameCategory: "Makanan", imageCategory: #imageLiteral(resourceName: "Domi")),
        categoryVocab (nameCategory: "Binatang", imageCategory: #imageLiteral(resourceName: "Domi")),
        
    ]
    return dataCategoryVocab
}
