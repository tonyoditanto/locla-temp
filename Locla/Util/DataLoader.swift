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
    private static let rewardCategoryFilename = "RewardCategory"
    
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
        var subtopics : [Subtopic] = []
        let fm = FileManager.default
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let subUrl = documentDirectory.appendingPathComponent("\(subtopicFilename).\(fileExtension)")
            var path : URL
            if fm.fileExists(atPath: subUrl.path) {
                path = subUrl
            } else {
                path = Bundle.main.url(forResource: subtopicFilename, withExtension: fileExtension)!
            }
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            subtopics = try decoder.decode([Subtopic].self, from: data)
            subtopics = subtopics.filter{ $0.topicID == topicID}
            
        } catch {
            print(error)
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
    
    static func getVocabularyChallenges(subtopicID: Int) -> [VocabularyChallenge] {
        var vocabularyChallenges = [VocabularyChallenge]()
        if let path = Bundle.main.url(forResource: vocabularyChallengeFilename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                vocabularyChallenges = try decoder.decode([VocabularyChallenge].self, from: data)
                vocabularyChallenges = vocabularyChallenges.filter{ $0.subtopicID == subtopicID}
            } catch {
                print(error)
            }
        }
        return vocabularyChallenges
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
    
    static func getRewards(locationID: Int, categoryID: Int) -> [Reward] {
        var rewards = [Reward]()
        if let path = Bundle.main.url(forResource: rewardFilename, withExtension: fileExtension){
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                rewards = try decoder.decode([Reward].self, from: data)
                rewards = rewards.filter{ ($0.categoryID == categoryID) && ($0.locationID == locationID)}
            } catch {
                print(error)
            }
        }
        return rewards
    }
    
    static func getRewardCategories() -> [RewardCategory] {
        var rewardCategories = [RewardCategory]()
        if let path = Bundle.main.url(forResource: rewardCategoryFilename, withExtension: fileExtension){
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                rewardCategories = try decoder.decode([RewardCategory].self, from: data)
            } catch {
                print(error)
            }
        }
        return rewardCategories
    }
    
    static func updateSubtopic(subtopicId: Int, star: Int){
        var subtopics : [Subtopic] = []
        let fm = FileManager.default
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let subUrl = documentDirectory.appendingPathComponent("\(subtopicFilename).\(fileExtension)")
            var path : URL
            if fm.fileExists(atPath: subUrl.path) {
                path = subUrl
            } else {
                path = Bundle.main.url(forResource: subtopicFilename, withExtension: fileExtension)!
            }
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            subtopics = try decoder.decode([Subtopic].self, from: data)
            
            var subtopic : Subtopic?
            var index = 0
            var changedIndex = 0
            for sub in subtopics{
                if sub.id == subtopicId {
                    subtopic = sub
                    subtopic?.starGained = star
                    subtopic?.status = Status.cleared
                    changedIndex = index
                }
                index += 1
            }
            subtopics.remove(at: changedIndex)
            subtopics.insert(subtopic!, at: changedIndex)
            
            if subtopics.indices.contains(changedIndex + 1) {
                subtopics[changedIndex + 1].status = Status.unlocked
            }
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(subtopics)
            try JsonData.write(to: subUrl)
        } catch {
            print(error)
        }
    }
    
}
