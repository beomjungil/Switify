import SpotifyiOS

internal final class iOSAdpator: NSObject, PlaybackAdpator {
    // MARK: Internal

    func play(id: String) {
        appRemote.playerAPI?.play(id) { _, error in
            if let error = error {
                print(error)
            }
        }
    }

    func play() {
        appRemote.playerAPI?.resume { _, error in
            if let error = error {
                print(error)
            }
        }
    }

    func pause() {
        appRemote.playerAPI?.pause { _, error in
            if let error = error {
                print(error)
            }
        }
    }

    func backward() {
        appRemote.playerAPI?.skip(toPrevious: { _, error in
            if let error = error {
                print(error)
            }
        })
    }

    func forward() {
        appRemote.playerAPI?.skip(toNext: { _, error in
            if let error = error {
                print(error)
            }
        })
    }

    func initialize() {
        let spotifyClientID = "2f3f92fc6ff14e6ab24b21423d1e6034"
        let spotifyRedirectURL = URL(string: "switify-callback://spotify-login")!

        let configuration = SPTConfiguration(
            clientID: spotifyClientID,
            redirectURL: spotifyRedirectURL
        )

        appRemote = .init(
            configuration: configuration,
            logLevel: SPTAppRemoteLogLevel.debug
        )
        appRemote.delegate = self

        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            appRemote.connectionParameters.accessToken = accessToken
            appRemote.connect()
        } else {
            getConnection()
        }
    }

    func handleURLOpen(_ url: URL) {
        let parameters = appRemote.authorizationParameters(from: url)
        if let accessToken = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = accessToken
            UserDefaults.standard.set(accessToken, forKey: "accessToken")
            appRemote.connect()
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {}
    }

    func getConnection(playWelcomeMusic: Bool = false) {
        guard appRemote.authorizeAndPlayURI(playWelcomeMusic ? "spotify:track:4Tt1XZQwX2doAEaeQt9QPF" : "") else {
            return
        }
    }

    // MARK: Private

    private var appRemote: SPTAppRemote!
    private var sessionManager: SPTSessionManager!
}

extension iOSAdpator: SPTAppRemotePlayerStateDelegate {
    func playerStateDidChange(_ sptPlayerState: SPTAppRemotePlayerState) {
        print(sptPlayerState.toPlayerState())
    }
}

extension iOSAdpator: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        self.appRemote = appRemote
        self.appRemote.playerAPI?.delegate = self
        self.appRemote.playerAPI?.subscribe(toPlayerState: { _, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
        })
    }

    func appRemote(_: SPTAppRemote, didDisconnectWithError _: Error?) {
        UserDefaults.standard.set(nil, forKey: "accessToken")
        getConnection()
    }

    func appRemote(_: SPTAppRemote, didFailConnectionAttemptWithError _: Error?) {
        UserDefaults.standard.set(nil, forKey: "accessToken")
        getConnection()
    }
}
