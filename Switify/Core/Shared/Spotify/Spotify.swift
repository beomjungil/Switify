import Foundation

final class Spotify {
    static let shared: Spotify = .init()

    let auth = SpotifyAuth()
}
