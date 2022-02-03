import SwiftUI

struct LibraryTab: View {
    var body: some View {
        SwitifyTabScaffold(title: Tabs.library.label) {
            VStack {
                Text("Library")
            }
        }
        .controlBar()
    }
}

struct LibraryTab_Previews: PreviewProvider {
    static var previews: some View {
        LibraryTab()
    }
}
