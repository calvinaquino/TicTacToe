import Foundation

extension Leaderboard {
    /// Convenience function that increments the victory count for a `player` by 1.
    ///
    /// - Parameter player: The player's score we want to increase
    mutating func incrementVictoriesFor(_ player: Mark) {
        if player == .cirle {
            circle += 1
        } else {
            cross += 1
        }
    }
}
