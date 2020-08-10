//
//  DataLoader.swift
//  Locla
//
//  Created by Rizal Hidayat on 10/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

class DataLoader {
    private static let fileExtension = "json"
    
    private static let locationFilename = "Location"
    private static let topicFilename = "Topic"
    private static let subtopicFilename = "Subtopic"
    private static let chatChallengeFilename = "ChatChallenge"
    private static let listeningChallengeFilename = "ListeningChallenge"
    private static let vocabularyChallengeFilename = "VocabularyChallenge"
    private static let vocabularyFilename = "Vocabulary"
    private static let vocabularyCategoryFilename = "VocabularyCategory"
    private static let randomTipFilename = "RandomTip"
    private static let rewardFilename = "Reward"
    
    static func getAllLocation() -> [Location] {
        var locations = [Location]()
        if let path = Bundle.main.url(forResource: locationFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                locations = try decoder.decode([Location].self, from: data)
            } catch {
                print(error)
            }
        }
        return locations
    }
    
    static func getTopics(locationID: Int) -> [Topic] {
        var topics = [Topic]()
        if let path = Bundle.main.url(forResource: topicFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                topics = try decoder.decode([Topic].self, from: data)
                topics = topics.filter { $0.locationID == locationID}
            } catch {
                print(error)
            }
        }
        return topics
    }
    
    static func getSubtopics(topicID: Int) -> [Subtopic] {
        var subtopics = [Subtopic]()
        if let path = Bundle.main.url(forResource: subtopicFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                subtopics = try decoder.decode([Subtopic].self, from: data)
                subtopics = subtopics.filter{ $0.topicID == topicID}
            } catch {
                print(error)
            }
        }
        return subtopics
    }
    
    static func getChatChallenges(subtopicID: Int) -> [ChatChallenge] {
        var chatChallenges = [ChatChallenge]()
        if let path = Bundle.main.url(forResource: chatChallengeFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                chatChallenges = try decoder.decode([ChatChallenge].self, from: data)
                chatChallenges = chatChallenges.filter{ $0.subtopicID == subtopicID}
            } catch {
                print(error)
            }
        }
        return chatChallenges
    }
    
    static func getListeningChallenges(subtopicID: Int) -> [ListeningChallenge] {
        var listeningChallenges = [ListeningChallenge]()
        if let path = Bundle.main.url(forResource: listeningChallengeFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                listeningChallenges = try decoder.decode([ListeningChallenge].self, from: data)
                listeningChallenges = listeningChallenges.filter{ $0.subtopicID == subtopicID}
            } catch {
                print(error)
            }
        }
        return listeningChallenges
    }
    
    static func getVocabularyChallenges(subtopicID: Int) -> [ListeningChallenge] {
        var listeningChallenges = [ListeningChallenge]()
        if let path = Bundle.main.url(forResource: vocabularyChallengeFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                listeningChallenges = try decoder.decode([ListeningChallenge].self, from: data)
                listeningChallenges = listeningChallenges.filter{ $0.subtopicID == subtopicID}
            } catch {
                print(error)
            }
        }
        return listeningChallenges
    }
    
    static func getVocabularyCategories(locationID: Int) -> [VocabularyCategory] {
        var vocabularyCategories = [VocabularyCategory]()
        if let path = Bundle.main.url(forResource: vocabularyCategoryFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                vocabularyCategories = try decoder.decode([VocabularyCategory].self, from: data)
                vocabularyCategories = vocabularyCategories.filter{ $0.locationID == locationID}
            } catch {
                print(error)
            }
        }
        return vocabularyCategories
    }
    
    static func getVocabularies(subtopicID: Int) -> [Vocabulary] {
        var vocabularies = [Vocabulary]()
        if let path = Bundle.main.url(forResource: vocabularyFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                vocabularies = try decoder.decode([Vocabulary].self, from: data)
                vocabularies = vocabularies.filter{ $0.subtopicID == subtopicID}
            } catch {
                print(error)
            }
        }
        return vocabularies
    }
    
    static func getVocabularies(categoryID: Int) -> [Vocabulary] {
        var vocabularies = [Vocabulary]()
        if let path = Bundle.main.url(forResource: vocabularyFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                vocabularies = try decoder.decode([Vocabulary].self, from: data)
                vocabularies = vocabularies.filter{ $0.categoryID == categoryID}
            } catch {
                print(error)
            }
        }
        return vocabularies
    }
    
    static func getRandomTip(locationID: Int) -> String {
        var tip = ""
        if let path = Bundle.main.url(forResource: randomTipFilename, withExtension: fileExtension){
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                let tips = try decoder.decode([RandomTip].self, from: data)
                tip = tips[Int.random(in: 0..<tips.count)].tips ?? ""
                print("are we here")
            } catch {
                print(error)
            }
        }
        return tip
    }
    
    static func getRewards(locationID: Int) -> [Reward] {
        var rewards = [Reward]()
        if let path = Bundle.main.url(forResource: rewardFilename, withExtension: fileExtension){
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                rewards = try decoder.decode([Reward].self, from: data)
                rewards = rewards.filter{ $0.locationID == locationID}
            } catch {
                print(error)
            }
        }
        return rewards
    }
}
