import XCTest
@testable import TicTacToeJobber

final class BoardStateTests: XCTestCase {
    
    func testEmptyBoardIsNotFullyMarked() {
        let game = GameViewModel(storage: InMemoryStorage())
        XCTAssertFalse(game.boardFullyMarked)
    }
    
    func testPartialBoardIsNotFullyMarked() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            0,0,1,
            0,2,0,
            1,0,0
        ]
        XCTAssertFalse(game.boardFullyMarked)
    }
    
    func testFullBoardIsFullyMarked() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            1,2,1,
            2,1,2,
            1,2,1
        ]
        XCTAssertTrue(game.boardFullyMarked)
    }
    
    func testReset() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            0,0,1,
            0,2,2,
            1,0,0
        ]
        XCTAssertNotNil(game.currentPlayer)
        game.reset()
        XCTAssertEqual(game.currentPlayer, .cross) // Cross always starts here
        XCTAssertFalse(game.boardFullyMarked)
    }
    
}
