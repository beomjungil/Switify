import SwiftUI

enum UserInterfaceIdiom {
    case phone
    case pad
    case desktop
    case unknown

    // MARK: Internal

    #if os(macOS)
        static let current: UserInterfaceIdiom = .desktop
    #elseif os(iOS)
        static var current: UserInterfaceIdiom {
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                return .phone
            case .pad:
                return .pad
            case .unspecified:
                return .unknown
            case .tv:
                return .unknown
            case .carPlay:
                return .unknown
            case .mac:
                return .desktop
            default:
                return .unknown
            }
        }
    #else
        #error("Unsupported platform")
    #endif
}
