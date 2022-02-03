import Foundation
#if canImport(SpotifyiOS)
    import SpotifyiOS
#endif

struct Track: Identifiable {
    var id: String
    var name: String
    var album: Album
    var artist: Artist
    var duration: Int
    var isSaved: Bool
    var isEpisode: Bool
    var isPodcast: Bool
}

#if canImport(SpotifyiOS)
    extension SPTAppRemoteTrack {
        func toTrack() -> Track {
            .init(
                id: uri,
                name: name,
                album: album.toAlbum(),
                artist: artist.toArtist(),
                duration: Int(duration),
                isSaved: isSaved,
                isEpisode: isEpisode,
                isPodcast: isPodcast
            )
        }
    }
#endif
