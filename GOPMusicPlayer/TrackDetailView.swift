//
//  TrackDetailView.swift
//  GOPMusicPlayer
//

import SwiftUI
import Observation

struct TrackDetailView: View {
    // @Environment: Reads an observable object provided by a parent view's environment() modifier
    @Environment(UserSettings.self) private var settings
    
    // We pass the same observable player object here. 
    // @Bindable allows us to create bindings to its properties in this view as well.
    @Bindable var player: Player
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "music.note.list")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding()
            
            Text("Current Track:")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(player.currentTrack)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            HStack {
                Text("Status:")
                    .font(.headline)
                Text(player.isPlaying ? "Playing" : "Paused")
                    .font(.title3)
                    .foregroundColor(player.isPlaying ? .green : .gray)
            }
            
            Spacer()

            // Modifying the state from this screen updates the PlayerView as well
            PlayButton(isPlaying: $player.isPlaying)
            
            Spacer()
            
            // @Bindable can also be used to create bindings to environment objects 
            // if we need to mutate them using UI controls like Toggles
            @Bindable var settingsBinding = settings
            
            Toggle("Show Track Duration in Queue", isOn: $settingsBinding.showTrackDuration)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    // Creating an instance of Player just for the preview
    TrackDetailView(player: Player(isPlaying: true, currentTrack: "Preview Song"))
}
