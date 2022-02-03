import SwiftUI

// MARK: - (macOS) Default Window Size

extension View {
    @ViewBuilder
    func macOSWindowSize() -> some View {
        modify(.macOS) {
            $0.frame(
                minWidth: 600,
                maxWidth: .infinity,
                minHeight: 400,
                maxHeight: .infinity
            )
        }
    }
}

// MARK: - (macOS) Hide Title Bar

extension WindowGroup {
    func setWindowStyle() -> some Scene {
        #if os(macOS)
            windowStyle(HiddenTitleBarWindowStyle())
                .windowToolbarStyle(.expanded)
        #else
            self
        #endif
    }
}

// MARK: - (macOS) Disable Tabbing

extension View {
    @ViewBuilder
    func disableTabbing() -> some View {
        modify(.macOS) {
            $0.onAppear {
                Window.allowsAutomaticWindowTabbing = false
            }
        }
    }
}
