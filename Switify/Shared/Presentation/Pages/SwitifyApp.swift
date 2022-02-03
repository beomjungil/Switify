import SwiftUI

struct Toolbar: View {
    var body: some View {
        HStack {
            Text("hi")
        }
        .ignoresSafeArea(.container, edges: .top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

@main
struct SwitifyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .macOSWindowSize()
                .disableTabbing()
                .onOpenURL {
                    SwitifyCore.shared.handleURLOpen($0)
                }
                .environmentSpotifyLoginState()
        }
        .setWindowStyle()
        .enableCommands()
    }
}

// MARK: - Commands

extension Scene {
    func enableCommands() -> some Scene {
        commands {
            SidebarCommands()
            #if os(macOS)
                CommandGroup(replacing: .sidebar) {}
            #endif
            CommandGroup(replacing: .newItem) {}
        }
    }
}
