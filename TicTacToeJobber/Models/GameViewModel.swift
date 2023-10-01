import Foundation

/// Manages game logic and flow
class GameViewModel: ObservableObject {
    
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
}
