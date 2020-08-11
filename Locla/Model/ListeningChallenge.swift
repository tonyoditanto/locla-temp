//
//  ListeningChallenge.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

// MARK: - ChatChallengeElement
struct ListeningChallenge: Codable {
    let id, subtopicID: Int
    let question, optionA, optionB, optionC: String?
    let optionD, selfChatText, fill1, fill2: String?
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
        case selfChatText = "self_chat_text"
        case fill1 = "fill_1"
        case fill2 = "fill_2"
        case tips
        case questionSoundFilename = "question_sound_filename"
        case clueSoundFilename = "clue_sound_filename"
    }
}
