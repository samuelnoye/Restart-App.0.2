//
//  AudioPlayer.swift
//  Restart-App.0.2
//
//  Created by Samuel Noye on 08/12/2021.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Could not play sound file.")
        }
    }
}
