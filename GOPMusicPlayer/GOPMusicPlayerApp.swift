//
//  GOPMusicPlayerApp.swift
//  GOPMusicPlayer
//
//  Created by user on 20/02/26.
//

import SwiftUI

@main
struct GOPMusicPlayerApp: App {
    @State private var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            PlayerView()
                // Injecting the observable object into the environment
                .environment(settings)
        }
    }
}
