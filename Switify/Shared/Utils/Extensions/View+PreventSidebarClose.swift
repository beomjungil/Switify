import Introspect
import SwiftUI

extension View {
    #if os(macOS)
        func introspectSplitView(customize: @escaping (NSSplitView) -> Void) -> some View {
            introspect(selector: TargetViewSelector.ancestorOrSiblingOfType, customize: customize)
        }
    #endif

    @ViewBuilder
    func preventSidebarCollapse() -> some View {
        #if os(macOS)
            introspectSplitView { splitView in
                (splitView.delegate as? NSSplitViewController)?.splitViewItems.first?.canCollapse = false
//                (splitView.delegate as? NSSplitViewController)?.splitViewItems.first?
//                    .holdingPriority = .defaultHigh
            }
        #endif
    }
}
