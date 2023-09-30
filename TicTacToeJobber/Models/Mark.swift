import Foundation

/// Represents a cross or a circle.
enum Mark: Int {
    case cross = 1 // goes first for now
    case cirle = 2
}

extension Mark {
    /// Returns a SF Symbol name for a mark type. Should be used in the `Image(systemName:)` initializer.
    var asImageResourceString: String {
        switch self {
        case .cirle: return "circle"
        case .cross: return "xmark"
        }
    }
}
