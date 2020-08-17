//
//  RewardCategory.swift
//  Locla
//
//  Created by Rizal Hidayat on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - RewardCategoryElement
struct RewardCategory: Codable {
    let id, requiredStar: Int
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case requiredStar = "required_star"
        case name
    }
}
