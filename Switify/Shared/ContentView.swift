import SFSafeSymbols
import SwiftUI

struct ContentView: View {
//    init() {
//        SwitifyCore.shared.initialize()
//    }

    @EnvironmentObject var loginViewState: SpotifyLoginViewState

    @State var currentTab: Tabs? = .home

    var body: some View {
        ZStack {
            NavigationView {
                SideBar(currentTab: $currentTab)
                    .modify(.macOS) {
                        $0.preventSidebarCollapse()
                    }
            }
            .visible(.desktop, .pad)

            BottomTabView(currentTab: $currentTab)
                .visible(.phone)
        }
        .modify(.phone) {
            $0.navigationViewStyle(.safeStack)
        }
        .sheet(isPresented: $loginViewState.isPresented) {
            VStack(spacing: 0) {
                HStack {
                    Text("Login")
                        .font(.system(.title2))
                        .bold()
                    Spacer()
                    Button(action: {
                        loginViewState.isPresented = false
                    }) {
                        Image(systemSymbol: .xmark)
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(.plain)
                }
                .padding(16)
                SpotifyLoginView()
                    .modify(.desktop) {
                        $0.frame(minWidth: 640, minHeight: 800)
                    }
            }
        }
    }
}

// MARK: - Previews

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
