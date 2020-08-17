//
//  Subtopic.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//
import Foundation

// MARK: - SubtopicElement
struct Subtopic: Codable {
    let id, topicID: Int
    let name: String?
    let challengeType: ChallengeType?
    var status: Status?
    var starGained: Int
    let totalStar: Int
    let subtopicDescription, mission, listeningFilename: String?

    enum CodingKeys: String, CodingKey {
        case id
        case topicID = "topic_id"
        case name
        case challengeType = "challenge_type"
        case status
        case starGained = "star_gained"
        case totalStar = "total_star"
        case subtopicDescription = "description"
        case mission
        case listeningFilename = "listening_filename"
    }
}

enum ChallengeType: String, Codable {
    case kosakata = "Kosakata"
    case mendengarkan = "Mendengarkan"
    case obrolan = "Obrolan"
}

enum Status: String, Codable {
    case locked = "Locked"
    case unlocked = "Unlocked"
    case cleared = "Cleared"
}

