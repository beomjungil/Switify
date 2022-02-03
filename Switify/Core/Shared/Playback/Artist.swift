import Foundation
#if canImport(SpotifyiOS)
    import SpotifyiOS
#endif

struct Artist: Identifiable {
    var id: String
    var name: String
}

#if canImport(SpotifyiOS)
    extension SPTAppRemoteArtist {
        func toArtist() -> Artist {
            .init(
                id: uri,
                name: name
            )
        }
    }
#endif
