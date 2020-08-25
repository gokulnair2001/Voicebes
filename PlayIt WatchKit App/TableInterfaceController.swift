//
//  TableInterfaceController.swift
//  PlayIt WatchKit Extension
//
//  Created by Gokul Nair on 25/08/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import AVFoundation
import WatchKit


class TableInterfaceController: WKInterfaceController, SoundPlay {
  
    @IBOutlet weak var table: WKInterfaceTable!
    
    var audioPlayer: AVAudioPlayer?
      
    
    let sounds = Bundle.main.urls(forResourcesWithExtension: "wav", subdirectory: nil)?.map{ $0.deletingPathExtension().lastPathComponent}.sorted() ?? []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        table.setNumberOfRows(sounds.count, withRowType: "Row")
        
        for (index, sound) in sounds.enumerated(){
            guard let row = table.rowController(at: index) as? SoundRow else {continue}
            row.musicLabel.setText(sound)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        playSound(named: sounds[rowIndex])
    }
}
