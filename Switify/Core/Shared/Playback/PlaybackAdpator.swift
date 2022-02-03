import Foundation

public protocol PlaybackAdpator {
    func initialize()

    func handleURLOpen(_ url: URL)

    func play()

    func pause()

    func backward()

    func forward()
}
