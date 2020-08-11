//
//  Vocabulary.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation


// MARK: - VocabularyElement
struct Vocabulary: Codable {
    let id, subtopicID: Int?
    let word, meaning: String?
    let categoryID: Int?
    let soundFilename: String?

    enum CodingKeys: String, CodingKey {
        case id
        case subtopicID = "subtopic_id"
        case word, meaning
        case categoryID = "category_id"
        case soundFilename = "sound_filename"
    }
}


