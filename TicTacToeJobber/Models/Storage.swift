import Foundation

/// Storage protocol for game state persistence
protocol Storage {
    func saveLeaderboard(leaderboard: Leaderboard)
    func loadLeaderboard() -> Leaderboard
    
    func saveCurrentPlayer(player: Mark?)
    func loadCurrentPlayer() -> Mark?
    
    func saveBoardState(state: [Int])
    func loadBoardState() -> [Int]
}

/// Implementation of Storage protocol that uses UserDefaults to persist game state
final class LocalStorage {
    private let boardStateKey = "BoardStateKey"
    
    private let crossLeaderboardKey = "CrossLeaderboardKey"
    private let circleLeaderboardKey = "CircleLeaderboardKey"
    
    private let currentPlayerKey = "CurrentPlayerKey"
}

extension LocalStorage: Storage {
    
    func saveLeaderboard(leaderboard: Leaderboard) {
        UserDefaults.standard.set(leaderboard.cross, forKey: crossLeaderboardKey)
        UserDefaults.standard.set(leaderboard.circle, forKey: circleLeaderboardKey)
    }
    
    func loadLeaderboard() -> Leaderboard {
        let userDefaults = UserDefaults.standard
        return Leaderboard(
            cross: userDefaults.integer(forKey: crossLeaderboardKey), circle: userDefaults.integer(forKey: circleLeaderboardKey))
    }
    
    func saveCurrentPlayer(player: Mark?) {
        UserDefaults.standard.set(player?.rawValue, forKey: currentPlayerKey)
    }
    
    func loadCurrentPlayer() -> Mark? {
        Mark(rawValue: UserDefaults.standard.integer(forKey: currentPlayerKey))
    }
    
    func saveBoardState(state: [Int]) {
        UserDefaults.standard.set(state, forKey: boardStateKey)
    }
    
    /// Loads existing board state inside UserDefaults or creates an empty one if it doesn't exist.
    func loadBoardState() -> [Int] {
        if let state = UserDefaults.standard.object(forKey: boardStateKey) as? [Int] {
            return state
        } else {
            return Array(repeating: 0, count: 9)
        }
    }
}
