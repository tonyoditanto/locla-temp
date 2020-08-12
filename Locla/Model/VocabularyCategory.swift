//
//  VocabularyCategory.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - VocabularyCategoryElement
struct VocabularyCategory: Codable {
    let id, locationID: Int
    let name, imageFilename, hexColor: String?

    enum CodingKeys: String, CodingKey {
        case id
        case locationID = "location_id"
        case name
        case imageFilename = "image_filename"
        case hexColor = "hex_color"
    }
}
