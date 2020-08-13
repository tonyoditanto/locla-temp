//
//  VocabularyChallenge.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - VocabularyChallengeElement
struct VocabularyChallenge: Codable {
    let id, subtopicID: Int
    let question, optionA, optionB, optionC: String?
    let optionD: String?
    let answer: Answer?
    let tips: String?
    let questionSoundFilename: String?
    let clueSoundFilename: String?

    enum CodingKeys: String, CodingKey {
        case id
        case subtopicID = "subtopic_id"
        case question
        case optionA = "option_a"
        case optionB = "option_b"
        case optionC = "option_c"
        case optionD = "option_d"
        case answer, tips
        case questionSoundFilename = "question_sound_filename"
        case clueSoundFilename = "clue_sound_filename"
    }
}

enum Answer: String, Codable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
}

