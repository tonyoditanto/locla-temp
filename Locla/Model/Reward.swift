//
//  Reward.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - RewardElement
struct RewardElement: Codable {
    let id, locationID: Int?
    let name, detail: String?

    enum CodingKeys: String, CodingKey {
        case id
        case locationID = "location_id"
        case name, detail
    }
}


