//
//  RandomTip.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - RandomTipElement
struct RandomTip: Codable {
    let id, locationID: Int?
    let tips: String?

    enum CodingKeys: String, CodingKey {
        case id, tips
        case locationID = "location_id"
    }
}

