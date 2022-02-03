import SwiftUI

struct SearchTab: View {
    var body: some View {
        SwitifyTabScaffold(title: Tabs.search.label) {
            VStack {
                Text("Search")
            }
        }
        .controlBar()
    }
}

struct SearchTab_Previews: PreviewProvider {
    static var previews: some View {
        SearchTab()
    }
}
