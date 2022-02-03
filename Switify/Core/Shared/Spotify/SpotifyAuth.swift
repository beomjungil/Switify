import Combine
import Foundation

final class SpotifyAuth {
    // MARK: Lifecycle

    init() {}

    // MARK: Internal

    func onLoggedIn(code: String) {
        UserDefaults.standard.set(code, forKey: "spotify-code")
    }
}

// MARK: - Client Info

extension SpotifyAuth {
    enum Constants {
        static let redirectURI = "https://example.com/switify-login"
        static let scopes = [
            "user-read-private",
            "playlist-modify-public",
            "playlist-read-private",
            "playlist-modify-private",
            "user-follow-read",
            "user-library-modify",
            "user-library-read",
            "user-read-email",
        ].joined(separator: "%20")

        static var basicToken: String {
            let data = "\(Self.clientID):\(Self.clientSecret)".data(using: .utf8)

            guard let base64EncodedString = data?.base64EncodedString() else {
                return ""
            }

            return base64EncodedString
        }

        static var loginURL: URL {
            var baseUrl = URLComponents(string: "https://accounts.spotify.com/authorize")!
            let queryItems: [URLQueryItem] = [
                .init(name: "response_type", value: "code"),
                .init(name: "client_id", value: Self.clientID),
                .init(name: "scope", value: scopes),
                .init(name: "redirect_uri", value: Self.redirectURI),
                .init(name: "show_dialog", value: "TRUE"),
            ]

            baseUrl.queryItems = queryItems
            return baseUrl.url!
        }
    }
}
