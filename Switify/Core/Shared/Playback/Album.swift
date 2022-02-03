import Foundation
#if canImport(SpotifyiOS)
    import SpotifyiOS
#endif

struct Album: Identifiable {
    var id: String
    var name: String
}

#if canImport(SpotifyiOS)
    extension SPTAppRemoteAlbum {
        func toAlbum() -> Album {
            .init(
                id: uri,
                name: name
            )
        }
    }
#endif
