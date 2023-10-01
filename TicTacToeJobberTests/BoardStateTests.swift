import XCTest
@testable import TicTacToeJobber

final class BoardStateTests: XCTestCase {
    func testReset() {
        let game = GameViewModel()
        game.boardState = [
            0,0,1,
            0,2,2,
            1,0,0
        ]
        XCTAssertNotNil(game.currentPlayer)
        game.reset()
        XCTAssertEqual(game.currentPlayer, .cross) // Cross always starts here
    }
    
}
