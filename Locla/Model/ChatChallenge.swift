//
//  ChatChallenge.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation


// MARK: - ChatChallenge
struct ChatChallenge: Codable {
    let id, subtopicID: Int
    let opponentChatText, opponentChatTextIndo, opponentFilename, selfChatTextIndo: String?
    let selfChatText, selfSoundFilename, optionA, optionB: String?
    let optionC, optionD, fill1, fill2: String?
    let tips: String?
    let opponentName: String?
    let opponentStatus: String?

    enum CodingKeys: String, CodingKey {
        case id
        case subtopicID = "subtopic_id"
        case opponentChatText = "opponent_chat_text"
        case opponentChatTextIndo = "opponent_chat_text_indo"
        case opponentFilename = "opponent_filename"
        case selfChatTextIndo = "self_chat_text_indo"
        case selfChatText = "self_chat_text"
        case selfSoundFilename = "self_sound_filename"
        case optionA = "option_a"
        case optionB = "option_b"
        case optionC = "option_c"
        case optionD = "option_d"
        case fill1 = "fill_1"
        case fill2 = "fill_2"
        case tips
        case opponentName = "opponent_name"
        case opponentStatus = "opponent_status"
    }
}
