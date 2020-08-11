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
    arrayOfReward = [Reward(name: "KenjeranPark", lokasi: "Jl. Sukolilo, Desa Sukolilo Baru, Kecamatan Bulak, Kota Surabaya", imageRewardName: "kenjeranpark.jpg", descReward: "tempat hiburan untuk keluarga dan teman, dengan berbagai macam wahana yang sangat menghibur dan juga berbagai tempat foto yang sangat instagramable", sourceIMG: "www.nativeindonesia.com"),
                     Reward(name: "Manggrove", lokasi: "Jl. Raya Wonorejo No.1, Wonorejo, Kec. Rungkut, Kota SBY, Jawa Timur", imageRewardName: "mangrove.jpg", descReward: "tempat hiburan2", sourceIMG:"sewabussurabaya.com"),
                     Reward(name: "House of Sampoerna", lokasi: "Taman Sampoerna No.6, Krembangan Utara, Kec. Pabean Cantian, Kota SBY, Jawa Timur", imageRewardName: "houseofsampoerna", descReward: "tempat hiburan3", sourceIMG: "commons.wikimedia.org")]
    }
}
