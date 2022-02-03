import Foundation

enum OperatingSystem {
    case macOS
    case iOS

    // MARK: Internal

    #if os(macOS)
        static let current = macOS
    #elseif os(iOS)
        static let current = iOS
    #else
        #error("Unsupported platform")
    #endif

    static var isIOS: Bool {
        current == .iOS
    }

    static var isMacOS: Bool {
        current == .macOS
    }
}
