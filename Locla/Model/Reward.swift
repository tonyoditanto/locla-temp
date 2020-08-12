//
//  Reward.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - RewardElement
struct Reward: Codable {
    let id, categoryID: Int
    let name, detail, imageFilename, imageSource: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case name, detail
        case imageFilename = "img_filename"
        case imageSource = "source_img"
    }
}


