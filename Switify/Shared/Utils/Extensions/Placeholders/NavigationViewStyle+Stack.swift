import SwiftUI

#if os(macOS)
    extension NavigationViewStyle where Self == DefaultNavigationViewStyle {
        static var safeStack: DefaultNavigationViewStyle {
            .automatic
        }
    }
#else
    extension NavigationViewStyle where Self == StackNavigationViewStyle {
        static var safeStack: StackNavigationViewStyle {
            .stack
        }
    }
#endif
