import XCTest
@testable import TicTacToeJobber

final class CellMarkingTests: XCTestCase {
    
    func testCellMarking() {
        let game = GameViewModel()
        XCTAssertNil(game.mark(for: 3))
        game.markCell(at: 3)
        XCTAssertEqual(game.mark(for: 3), .cross)
    }
    
    func testCellMarkingSwitchesCurrentPlayer() {
        let game = GameViewModel()
        game.markCell(at: 3)
        XCTAssertEqual(game.mark(for: 3), .cross)
        game.markCell(at: 1)
        XCTAssertEqual(game.mark(for: 1), .cirle)
    }
    
    func testCellMarkingAlreadyMarkedCell() {
        let game = GameViewModel()
        game.markCell(at: 3)
        XCTAssertEqual(game.mark(for: 3), .cross)
        game.markCell(at: 3)
        XCTAssertNotEqual(game.mark(for: 3), .cirle)
    }
    
    func testCellMarkingChecksVictoryPatterns() {
        let game = GameViewModel()
        game.boardState = [
            1,1,0,
            0,2,0,
            2,0,0
        ]
        game.markCell(at: 2)
        XCTAssertEqual(game.mark(for: 2), .cross)
        XCTAssertEqual(game.winner, .cross)
    }
    
    func testCellMarkingEndsGameIfBoardIsFull() {
        let game = GameViewModel()
        game.boardState = [
            1,2,0,
            2,2,1,
            2,1,2
        ]
        game.markCell(at: 2)
        XCTAssertEqual(game.mark(for: 2), .cross)
        XCTAssertNil(game.winner)
        XCTAssertNil(game.currentPlayer)
    }
}
