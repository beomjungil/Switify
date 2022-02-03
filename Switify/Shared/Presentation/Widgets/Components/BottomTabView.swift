import Introspect
import SwiftUI

#if os(iOS)
    typealias NativeView = UIView
#elseif os(macOS)
    typealias NativeView = NSView
#endif

struct BottomTabView: View {
    @State private var lastHostingView: NativeView!
    @Binding var currentTab: Tabs?
    @EnvironmentObject var loginViewState: SpotifyLoginViewState

    var body: some View {
        TabView(selection: $currentTab) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                NavigationView {
                    tab.view
                        .toolbar {
                            Button(action: {
                                loginViewState.isPresented = true
                            }) {
                                Text("Login")
                            }
                            .visible(.phone)
                        }
                }
                .tabItem {
                    Label(tab.label, systemSymbol: tab.symbol)
                    Text(tab.label)
                }
                .tag(tab)
            }
        }
        #if canImport(UIKit)
        .introspectTabBarController {
            let appearance = $0.tabBar.standardAppearance
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear

            if #available(iOS 15.0, *) {
                $0.tabBar.scrollEdgeAppearance = appearance
            } else {
                $0.tabBar.standardAppearance = appearance
            }
        }
        #endif
    }
}

// MARK: - Previews

#if DEBUG
    struct BottomTabView_Previews: PreviewProvider {
        struct PreviewContainer: View {
            @State var currentTab: Tabs? = .home

            var body: some View {
                BottomTabView(
                    currentTab: $currentTab
                )
            }
        }

        static var previews: some View {
            PreviewContainer()
        }
    }
#endif
