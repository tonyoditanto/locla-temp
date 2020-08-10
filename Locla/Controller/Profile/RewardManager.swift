//
//  RewardManager.swift
//  Locla
//
//  Created by Edward da Costa on 11/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation


public class RewardManager {
    var arrayOfReward: [Reward]
   init() {
    arrayOfReward = [Reward(name: "KenjeranPark", lokasi: "Jalan A", imageRewardName: "kenjeranpark.jpg", descReward: "tempat hiburan untuk keluarga dan teman, dengan berbagai macam wahana yang sangat menghibur dan juga berbagai tempat foto yang sangat instagramable"),
    Reward(name: "Manggrove", lokasi: "Jalan b", imageRewardName: "", descReward: "tempat hiburan2"),
    Reward(name: "Surabaya Carnival", lokasi: "Jalan C", imageRewardName: "", descReward: "tempat hiburan3")]
    }
}
