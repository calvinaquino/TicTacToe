import Foundation

/// Manages game logic and flow
class GameViewModel: ObservableObject {
    /// Manages storing the game state between app sessions
    let storage: Storage
    /// Keeps track of players scores
    var leaderboard = Leaderboard()
    /// The current player. If nil, there is no game ongoing.
    var currentPlayer: Mark? = .cross
    /// The winner for the last round. If nil and there is a currentPlayer, then there is a game ongoing
    /// If there isn't a currentPlayer, there isn't a game ongoing, and the last game was a draw.
    var winner: Mark? = nil
    /// The storage for all the marked indexes of the board. Has a size of 9
    @Published var boardState: [Int] = Array(repeating: 0, count: Constants.boardRange.count)
    
    /// Initializes the Game View Model object with an optional Storage.
    ///
    /// - Parameter storage: Optional. Defaults to a local implementation that uses UserDefaults
    init(storage: Storage = LocalStorage()) {
        self.storage = storage
        self.leaderboard = storage.loadLeaderboard()
        self.currentPlayer = storage.loadCurrentPlayer()
        self.boardState = storage.loadBoardState()
    }
}

// MARK: - State checking functions

extension GameViewModel {
    /// Returns `True` if all indexes are marked.
    var boardFullyMarked: Bool {
        // if all indexes dont have a 0 value, the entire board was marked.
        boardState.allSatisfy { $0 != 0 }
    }
    /// Validates whether the `player` has a victory pattern in the current board.
    func checkVictoryConditions(for player: Mark) -> Bool {
        let playerNumber = player.rawValue
        var patternMatched = false
        for pattern in Constants.victoryPatterns {
            patternMatched = pattern.allSatisfy { index in
                boardState[index] == playerNumber
            }
            if patternMatched {
                break
            }
        }
        
        return patternMatched
    }
}

// MARK: - Game flow

extension GameViewModel {
    /**
    Returns the `Mark` for a specific cell index, or nil if it wasn't marked.
     
     - Parameter index: The grid cell index.
     - Returns: Either a `Mark` if the cell was already marked, or nil.
     */
    func mark(for index: Int) -> Mark? {
        Mark(rawValue: self.boardState[index])
    }
    
    /**
    Marks the cell at index for the `currentPlayer`
     
     - Parameter index: The grid cell index.
     */
    func markCell(at index: Int) {
        // make sure we can mark cell
        // cell must be empty and turn must not be finished
        guard mark(for: index) == nil, let currentPlayer else {
            return
        }
        // mark the cell
        // because marking and players share the same model, we can use currentPlayer raw value directly as a boardState value.
        boardState[index] = currentPlayer.rawValue
        
        // toggle turn if there are still empty cells, else mark as finished
        let victorious = checkVictoryConditions(for: currentPlayer)
        if victorious {
            winner = currentPlayer
            leaderboard.incrementVictoriesFor(currentPlayer)
            self.currentPlayer = nil
        } else if boardFullyMarked {
            self.currentPlayer = nil
            // DRAW
        } else {
            // if turn was circle, switch to cross and vice versa
            self.currentPlayer = currentPlayer == .cirle ? .cross : .cirle
        }
    }
    
    /// Reinitlailzies the `boardState` with zeroes and assigns the `currentPlayer` to `cross`.
    func reset() {
        boardState = Array(repeating: 0, count: 9)
        currentPlayer = .cross
    }
    
    /// Stores leaderboard, current player and board state into the User Defaults
    func save() {
        storage.saveLeaderboard(leaderboard: leaderboard)
        storage.saveCurrentPlayer(player: currentPlayer)
        storage.saveBoardState(state: boardState)
    }
}
