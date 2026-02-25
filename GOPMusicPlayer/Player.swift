//
//  Player.swift
//  GOPMusicPlayer
//
//  Created by user on 20/02/26.
//

import Foundation
// @Observable: A macro that makes a class observable, allowing views to automatically update when its properties change.
@Observable
class Player {
    var isPlaying: Bool = false
    var currentTrack: String = "Unknown Track"
    
    init(isPlaying: Bool = false, currentTrack: String = "Unknown Track") {
        self.isPlaying = isPlaying
        self.currentTrack = currentTrack
    }
}
