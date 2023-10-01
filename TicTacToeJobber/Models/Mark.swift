import Foundation

/// Represents a cross or a circle.
/// Also used to represent a Player
///
/// Because of the simplistic approach for game logic in a tic tac toe game, we can use a single type to represent a cell state, a player, a turn, etc.
/// as they are all related
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
