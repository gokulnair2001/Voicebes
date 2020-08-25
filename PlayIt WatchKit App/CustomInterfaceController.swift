//
//  CustomInterfaceController.swift
//  PlayIt WatchKit Extension
//
//  Created by Gokul Nair on 25/08/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import WatchKit
import AVFoundation


class CustomInterfaceController: WKInterfaceController {

    let saveURl = FileManager.default.getDocumentsDirectory().appendingPathComponent("recording.wav")
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var recordTapped: WKInterfaceButton!
    @IBOutlet weak var playTapped: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func recordBtn() {
        presentAudioRecorderController(withOutputURL: saveURl, preset: .wideBandSpeech){
            (sucess, error) in
            if sucess {
                print("The recording is saved sucessfully")
            }else{
                print(error?.localizedDescription ?? "Unknown Error")
            }
        }
    }
    
    @IBAction func playButto() {
        guard FileManager.default.fileExists(atPath: saveURl.path) else {
            return
        }
        
        try? audioPlayer = AVAudioPlayer(contentsOf: saveURl)
        audioPlayer?.play()
    }
}
