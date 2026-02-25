//
//  PlayerView.swift
//  GOPMusicPlayer
//
//  Created by user on 20/02/26.
//

import SwiftUI

struct PlayerView: View {
    // @State: Creates and manages a source of truth for data within this view. Here, it instantiates the Player model.
    @State private var player = Player(currentTrack: "The Beatles - Come Together")
    
    var body: some View {
        NavigationStack {
            // @Bindable: Creates bindings to an observable object's properties, allowing child views to read and write to them.
            @Bindable var playerBinding = player
            
            VStack(spacing: 20) {
                Text("Music Player")
                    .font(.largeTitle)
                    .bold()
                

                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Queue")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 5)
                        .padding(.bottom, 5)
                    
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            // Structuring the data for our list
                            let songs = [
                                (id: "The Beatles - Come Together", title: "Come Together", artist: "The Beatles"),
                                (id: "The Beatles - Here Comes The Sun", title: "Here Comes The Sun", artist: "The Beatles"),
                                (id: "John Mayer - Why Georgia", title: "Why Georgia", artist: "John Mayer")
                            ]
                            
                            ForEach(songs, id: \.id) { song in
                                Button(action: {
                                    player.currentTrack = song.id
                                }) {
                                    HStack(spacing: 15) {
                                        Image(systemName: "music.note")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .padding(14)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(8)
                                            .foregroundColor(.primary)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(song.title)
                                                .font(.headline)
                                                .foregroundColor(player.currentTrack == song.id ? .green : .primary)
                                            
                                            Text(song.artist)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                        
                                        Spacer()
                                                                                
                                        if player.currentTrack == song.id {
                                            Image(systemName: "speaker.wave.2.fill")
                                                .foregroundColor(.green)
                                        } else {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 8)
                                    .background(player.currentTrack == song.id ? Color.green.opacity(0.1) : Color.clear)
                                    .cornerRadius(8)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .frame(maxHeight: 260) // Restrict height so it fits well with the other elements
                }
                .padding()
                
                Spacer()
                
                // Mini-player navigating to the second screen
                NavigationLink(destination: TrackDetailView(player: player)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(player.currentTrack)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text(player.isPlaying ? "Playing..." : "Paused")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        PlayButton(isPlaying: $playerBinding.isPlaying)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            .padding()
        }
    }
}

#Preview {
    PlayerView()
}
