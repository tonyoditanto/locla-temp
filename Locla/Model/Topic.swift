//
//  Topic.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation


// MARK: - SubtopicElement
struct Topic: Codable {
    let id: Int
    let name, imageFilename: String?
    let locationID: Int
    let hexColor: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageFilename = "image_filename"
        case locationID = "location_id"
        case hexColor = "hex_color"
    }
}

