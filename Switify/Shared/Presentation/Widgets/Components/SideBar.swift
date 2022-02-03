import Introspect
import SFSafeSymbols
import SwiftUI

struct SideBar: View {
    @Binding var currentTab: Tabs?
    @EnvironmentObject var loginViewState: SpotifyLoginViewState

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            List {
                Text("Switify")
                    .font(.system(.largeTitle))
                    .bold()
                    .padding(.top, 68)
                    .visible(.pad)
                Spacer()
                    .frame(height: 20)
                    .visible(.desktop)

                ForEach(Tabs.allCases, id: \.self) { tab in
                    NavigationLink(
                        destination: tab.view,
                        tag: tab,
                        selection: $currentTab
                    ) {
                        Label(tab.label, systemSymbol: tab.symbol)
                    }
                }
                Divider()
            }
            .listStyle(.sidebar)
            .modify(.iOS) {
                $0
                    .navigationTitle("")
                    .ignoresSafeArea(.container, edges: .top)
                    .introspectTableView {
                        $0.backgroundColor = .secondarySystemBackground
                    }
            }

            VStack(spacing: 0) {
                Divider()
                HStack {
                    Image(systemSymbol: .personCircle)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.secondary)
                    Text("Login")
                    Spacer()
                }
                .frame(height: controlBarHeight)
                .padding(.horizontal, 16)
            }
            .onTapGesture {
                loginViewState.isPresented = true
            }
        }
    }
}

// MARK: - Previews

#if DEBUG
    struct SideBar_Previews: PreviewProvider {
        struct PreviewContainer: View {
            @State var currentTab: Tabs? = .home

            var body: some View {
                SideBar(
                    currentTab: $currentTab
                )
            }
        }

        static var previews: some View {
            PreviewContainer()
        }
    }
#endif
