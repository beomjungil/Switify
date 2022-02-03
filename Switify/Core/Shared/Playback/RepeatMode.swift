import Foundation
#if canImport(SpotifyiOS)
    import SpotifyiOS
#endif

enum RepeatMode: CaseIterable {
    case off
    case track
    case context
}

#if canImport(SpotifyiOS)
    extension SPTAppRemotePlaybackOptionsRepeatMode {
        func toRepeatMode() -> RepeatMode {
            switch self {
            case .track:
                return .track
            case .context:
                return .context
            case .off:
                return .off
            @unknown default:
                return .off
            }
        }
    }
#endif
