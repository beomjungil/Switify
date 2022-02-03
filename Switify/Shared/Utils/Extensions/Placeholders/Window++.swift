import SwiftUI

#if os(macOS)
    typealias Window = NSWindow
#else
    typealias Window = UIWindow

    extension Window {
        static var allowsAutomaticWindowTabbing: Bool {
            get { true }
            set {}
        }
    }
#endif
