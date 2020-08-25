//
//  SoundPlay.swift
//  PlayIt WatchKit Extension
//
//  Created by Gokul Nair on 25/08/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import AVFoundation

protocol SoundPlay: AnyObject {
    var audioPlayer: AVAudioPlayer? {get set}
}

extension SoundPlay {
    func playSound(named name: String) {
        guard  let url = Bundle.main.url(forResource: name, withExtension: "wav") else {
            fatalError("Unable to find \(name) music!")
        }
       
        try? audioPlayer = AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
}
