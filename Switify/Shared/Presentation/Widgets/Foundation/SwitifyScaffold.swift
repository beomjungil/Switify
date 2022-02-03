import SwiftUI

struct SwitifyTabScaffold<C: View>: View {
    // MARK: Lifecycle

    init(title: String, @ViewBuilder child: () -> C) {
        self.title = title
        self.child = child()
    }

    // MARK: Internal

    let title: String
    let child: C

    var body: some View {
        GeometryReader { proxy in
            let defaultPadding = proxy.frame(in: .global).size.width >= 414 ? 20.0 : 16.0

            ScrollView {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(.largeTitle))
                        .bold()
                        .padding(.top, 24)
                        .padding(.horizontal, defaultPadding)
                        .visible(.desktop)

                    child
                        .padding(.horizontal, defaultPadding)
                }
            }
        }
        .modify(.iOS) {
            $0.navigationTitle(title)
        }
    }
}
