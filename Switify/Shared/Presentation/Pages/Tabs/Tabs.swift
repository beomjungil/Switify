import SFSafeSymbols
import SwiftUI

enum Tabs: String, CaseIterable {
    case home
    case search
    case library

    // MARK: Internal

    var view: AnyView {
        switch self {
        case .home: return AnyView(HomeTab())
        case .search: return AnyView(SearchTab())
        case .library: return AnyView(LibraryTab())
        }
    }

    var label: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .library: return "Library"
        }
    }

    var symbol: SFSymbol {
        switch self {
        case .home: return .musicNoteHouse
        case .search: return .magnifyingglass
        case .library: return .booksVertical
        }
    }
}
