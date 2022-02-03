import SwiftUI

let controlBarHeight = 64.0

private struct ControlBar: View {
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 24) {
                Spacer()
                Image(systemSymbol: .backwardFill)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .opacity(0.5)
                Image(systemSymbol: .playFill)
                    .resizable()
                    .frame(width: 24, height: 24)
                Image(systemSymbol: .forwardFill)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .opacity(0.5)
                Spacer()
            }
            .frame(height: controlBarHeight)
        }
        .background(
            VisualEffectView(style: .regular)
                .ignoresSafeArea(.container, edges: .bottom)
        )
    }
}

extension View {
    @ViewBuilder
    func controlBar() -> some View {
        ZStack(alignment: .bottom) {
            self
            ControlBar()
        }
    }
}

struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar()
    }
}
