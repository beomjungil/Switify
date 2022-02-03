import SwiftUI

#if os(macOS)
    fileprivate typealias NativeVisualStyle = NSVisualEffectView.Material
#else
    fileprivate typealias NativeVisualStyle = UIBlurEffect.Style
#endif

enum VisualStyle {
    case regular

    // MARK: Fileprivate

    fileprivate var toNative: NativeVisualStyle {
        #if os(macOS)
            switch self {
            case .regular:
                return .titlebar
            }
        #else
            switch self {
            case .regular:
                return .regular
            }
        #endif
    }
}

#if os(macOS)
    struct VisualEffectView: NSViewRepresentable {
        var style: VisualStyle

        func makeNSView(context _: NSViewRepresentableContext<Self>) -> NSVisualEffectView {
            NSVisualEffectView()
        }

        func updateNSView(_ nsView: NSVisualEffectView, context _: NSViewRepresentableContext<Self>) {
            nsView.material = style.toNative
        }
    }
#else
    struct VisualEffectView: UIViewRepresentable {
        var style: VisualStyle

        func makeUIView(context _: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
            UIVisualEffectView()
        }

        func updateUIView(_ uiView: UIVisualEffectView, context _: UIViewRepresentableContext<Self>) {
            uiView.effect = UIBlurEffect(style: style.toNative)
        }
    }
#endif
