//
//  PlayButton.swift
//  GOPMusicPlayer
//
//  Created by user on 20/02/26.
//

import SwiftUI

struct PlayButton: View {
    // @Binding: Creates a connection to a value provided by another view (like PlayerView), allowing this view to modify it.
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}
