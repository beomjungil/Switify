import Foundation
#if canImport(SpotifyiOS)
    import SpotifyiOS
#endif

struct PlayerState {
    var track: Track
    var playbackSpeed: Double
    var playbackPosition: Int
    var isShuffling: Bool
    var repeatMode: RepeatMode
    var isPaused: Bool

    var isPlaying: Bool {
        !isPaused && playbackSpeed > 0.0
    }
}

#if canImport(SpotifyiOS)
    extension SPTAppRemotePlayerState {
        func toPlayerState() -> PlayerState {
            .init(
                track: track.toTrack(),
                playbackSpeed: Double(playbackSpeed),
                playbackPosition: playbackPosition,
                isShuffling: playbackOptions.isShuffling,
                repeatMode: playbackOptions.repeatMode.toRepeatMode(),
                isPaused: isPaused
            )
        }
    }
#endif
