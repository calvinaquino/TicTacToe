import XCTest
@testable import TicTacToeJobber

final class LeaderboardTests: XCTestCase {
    
    func testCircleWin() {
        let game = GameViewModel()
        game.currentPlayer = .cirle
        game.boardState = [
            0,0,1,
            2,0,2,
            1,0,0
        ]
        game.markCell(at: 4)
        XCTAssertEqual(game.leaderboard.circle, 1)
        XCTAssertEqual(game.leaderboard.cross, 0)
    }
    
    func testCrossWin() {
        let game = GameViewModel()
        game.currentPlayer = .cross
        game.boardState = [
            0,0,1,
            2,0,2,
            1,0,0
        ]
        game.markCell(at: 4)
        XCTAssertEqual(game.leaderboard.cross, 1)
        XCTAssertEqual(game.leaderboard.circle, 0)
    }
    
    func testDraw() {
        let game = GameViewModel()
        game.currentPlayer = .cirle
        game.boardState = [
            2,2,1,
            1,2,2,
            1,1,2
        ]
        game.markCell(at: 4)
        XCTAssertEqual(game.leaderboard.circle, 0)
        XCTAssertEqual(game.leaderboard.cross, 0)
    }
    
}
