import Foundation

func when(
    _ operatingSystem: OperatingSystem...,
    completion: () -> Void
) {
    if operatingSystem.contains(OperatingSystem.current) {
        completion()
    }
}

func when<R>(
    _ operatingSystem: OperatingSystem...,
    completion: () -> R
) -> R? {
    if operatingSystem.contains(OperatingSystem.current) {
        return completion()
    }
    return nil
}

func when(
    _ idioms: UserInterfaceIdiom...,
    completion: () -> Void
) {
    if idioms.contains(UserInterfaceIdiom.current) {
        completion()
    }
}

func when<R>(
    _ idioms: UserInterfaceIdiom...,
    completion: () -> R
) -> R? {
    if idioms.contains(UserInterfaceIdiom.current) {
        return completion()
    }
    return nil
}
