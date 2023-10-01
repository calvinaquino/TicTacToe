import Foundation

/// Manages game logic and flow
class GameViewModel: ObservableObject {
    /// The current player. If nil, there is no game ongoing.
    var currentPlayer: Mark? = .cross
    /// The storage for all the marked indexes of the board. Has a size of 9
    @Published var boardState: [Int] = Array(repeating: 0, count: Constants.boardRange.count)
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
        switch currentPlayer {
        case .cross:
            boardState[index] = 1
        case .cirle:
            boardState[index] = 2
        }
        
        // toggle turn
        self.currentPlayer = currentPlayer == .cirle ? .cross : .cirle
    }
}
