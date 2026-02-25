//
//  UserSettings.swift
//  GOPMusicPlayer
//

import SwiftUI
import Observation

// @Observable is used for Environment as well in modern SwiftUI
@Observable
class UserSettings {
    var isDarkModeEnabled: Bool = false
    var showTrackDuration: Bool = true
}
