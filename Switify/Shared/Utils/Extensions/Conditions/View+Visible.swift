import SwiftUI

extension View {
    /// Show UI when `visible` is true.
    @ViewBuilder
    func visible(
        _ visible: Bool
    ) -> some View {
        if visible {
            self
        }
    }

    /// Show UI when it's desired `OperatingSystem`
    @ViewBuilder
    func visible(
        _ operatingSystem: OperatingSystem...
    ) -> some View {
        if operatingSystem.contains(OperatingSystem.current) {
            self
        }
    }

    /// Show UI when it's desired `UserInterfaceIdiom`
    @ViewBuilder
    func visible(
        _ idioms: UserInterfaceIdiom...
    ) -> some View {
        if idioms.contains(UserInterfaceIdiom.current) {
            self
        }
    }
}
