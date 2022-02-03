import SwiftUI

struct HomeTab: View {
    var body: some View {
        SwitifyTabScaffold(title: Tabs.home.label) {
            VStack {
                Button(action: {
                    SwitifyCore.shared.initialize()
                }) {
                    Text("Intialize")
                }
                Button(action: {
                    SwitifyCore.shared.playback.play()
                }) {
                    Text("Play Any Song")
                }
                Button(action: {
                    SwitifyCore.shared.playback.pause()
                }) {
                    Text("Pause")
                }
                ForEach(0 ... 100, id: \.self) {
                    Text("\($0)")
                        .font(.system(.largeTitle))
                }
                Spacer()
                    .frame(maxWidth: .infinity)
            }
        }
        .controlBar()
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
