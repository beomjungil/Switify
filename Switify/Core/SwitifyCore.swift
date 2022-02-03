import Foundation

class SwitifyCore {
    // MARK: Lifecycle

    init() {}

    // MARK: Internal

    static let shared: SwitifyCore = .init()

    #if os(iOS)
        let playback: PlaybackAdpator = iOSAdpator()
    #elseif os(macOS)
        let playback: PlaybackAdpator = macOSAdpator()
    #else
        #error("Unsupported OS!")
    #endif
    static let spotify = Spotify()

    func initialize() {
        playback.initialize()
    }

    func handleURLOpen(_ url: URL) {
        playback.handleURLOpen(url)
    }
}
