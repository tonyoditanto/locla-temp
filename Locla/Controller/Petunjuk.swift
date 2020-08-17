//
//  Petunjuk.swift
//  Locla
//
//  Created by Tony Varian Yoditanto on 17/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

class Petunjuk {
    static func playPetunjuk(petunjukName : String?){
        let petunjukURL = Bundle.main.url(forResource: petunjukName, withExtension: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: petunjukURL!)
        } catch {
            print(error)
        }
        
        player?.play()
    }
}

