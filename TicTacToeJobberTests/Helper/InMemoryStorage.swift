import Foundation
@testable import TicTacToeJobber

class InMemoryStorage: Storage {
    private var leaderboard: Leaderboard = Leaderboard()
    private var currentPlayer: Mark? = .cross
    private var boardState: [Int] = Array(repeating: 0, count: 9)
    
    func saveLeaderboard(leaderboard: TicTacToeJobber.Leaderboard) {
        self.leaderboard = leaderboard
    }
    
    func loadLeaderboard() -> TicTacToeJobber.Leaderboard {
        leaderboard
    }
    
    func saveCurrentPlayer(player: TicTacToeJobber.Mark?) {
        self.currentPlayer = player
    }
    
    func loadCurrentPlayer() -> TicTacToeJobber.Mark? {
        currentPlayer
    }
    
    func saveBoardState(state: [Int]) {
        self.boardState = state
    }
    
    func loadBoardState() -> [Int] {
        boardState
    }
}
