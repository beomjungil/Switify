import SwiftUI

struct Offset {
    let horizontal: Double
}

#if os(macOS)
    enum NavigationBarAppearance {
        static var titlePositionAdjustment: Offset {
            .init(
                horizontal: 20
            )
        }
    }
#else
    typealias NavigationBarAppearance = UINavigationBarAppearance
#endif
