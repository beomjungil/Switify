import SwiftUI
import WebKit

struct SpotifyLoginView {
    @EnvironmentObject var loginViewState: SpotifyLoginViewState

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

// MARK: - Coodinator

extension SpotifyLoginView {
    class Coordinator: NSObject, WKNavigationDelegate {
        // MARK: Lifecycle

        init(_ parent: SpotifyLoginView) {
            self.parent = parent
            super.init()

            webview.navigationDelegate = self
            webview.uiDelegate = self as? WKUIDelegate
            webview.load(URLRequest(url: SpotifyAuth.Constants.loginURL))
        }

        // MARK: Internal

        var webview: WKWebView = {
            let preferences = WKWebpagePreferences()
            preferences.allowsContentJavaScript = true

            let configuration = WKWebViewConfiguration()
            configuration.defaultWebpagePreferences = preferences

            let webView = WKWebView(
                frame: .zero,
                configuration: configuration
            )
            webView.allowsBackForwardNavigationGestures = true
            #if os(iOS)
                webView.scrollView.isScrollEnabled = true
            #endif

            return webView
        }()

        var parent: SpotifyLoginView

        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            guard let url = webView.url,
                  url.path == "/switify-login",
                  let code = url.queryParameters?["code"]
            else {
                return
            }

            parent.loginViewState.isPresented = false
            SwitifyCore.spotify.auth.onLoggedIn(code: code)
        }
    }
}

// MARK: - Environment

class SpotifyLoginViewState: ObservableObject {
    @Published var isPresented = false
}

extension View {
    @ViewBuilder
    func environmentSpotifyLoginState() -> some View {
        environmentObject(SpotifyLoginViewState())
    }
}

// MARK: - iOS

#if os(iOS)
    extension SpotifyLoginView: UIViewRepresentable {
        func makeUIView(context: Context) -> WKWebView {
            context.coordinator.webview
        }

        func updateUIView(_: WKWebView, context _: Context) {}
    }
#endif

// MARK: - macOS

#if os(macOS)
    extension SpotifyLoginView: NSViewRepresentable {
        func makeNSView(context: Context) -> WKWebView {
            context.coordinator.webview
        }

        func updateNSView(_: WKWebView, context _: Context) {}
    }
#endif
