import SwiftUI

extension View {
    /// Modify UI when `visible` is true.
    @ViewBuilder
    func modify<Content: View>(
        if condition: Bool,
        modifier: (Self) -> Content
    ) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }

    /// Modify UI when it's desired `OperatingSystem`
    @ViewBuilder
    func modify<Content: View>(
        _ operatingSystem: OperatingSystem...,
        modifier: (Self) -> Content
    ) -> some View {
        if operatingSystem.contains(OperatingSystem.current) {
            modifier(self)
        } else {
            self
        }
    }

    /// Modify UI when it's desired `UserInterfaceIdiom`
    @ViewBuilder
    func modify<Content: View>(
        _ idioms: UserInterfaceIdiom...,
        modifier: (Self) -> Content
    ) -> some View {
        if idioms.contains(UserInterfaceIdiom.current) {
            modifier(self)
        } else {
            self
        }
    }
}
