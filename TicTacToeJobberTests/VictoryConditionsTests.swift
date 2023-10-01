import XCTest
@testable import TicTacToeJobber

final class VictoryConditionsTests: XCTestCase {
    
    func testCrossWinPartialBoard() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            1,1,1,
            0,2,0,
            2,0,0
        ]
        XCTAssertTrue(game.checkVictoryConditions(for: .cross))
        XCTAssertFalse(game.checkVictoryConditions(for: .cirle))
    }
    
    func testCircleWinPartialBoard() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            1,1,2,
            0,2,0,
            2,0,1
        ]
        XCTAssertTrue(game.checkVictoryConditions(for: .cirle))
        XCTAssertFalse(game.checkVictoryConditions(for: .cross))
    }
    
    func testCrossWinFullBoard() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            1,1,1,
            1,2,2,
            2,2,1
        ]
        XCTAssertTrue(game.checkVictoryConditions(for: .cross))
        XCTAssertFalse(game.checkVictoryConditions(for: .cirle))
    }
    
    func testCircleWinFullBoard() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            1,1,2,
            1,2,2,
            2,1,1
        ]
        XCTAssertTrue(game.checkVictoryConditions(for: .cirle))
        XCTAssertFalse(game.checkVictoryConditions(for: .cross))
    }
    
    func testNoWinnerFullBoard() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            2,1,2,
            2,1,1,
            1,2,2
        ]
        XCTAssertFalse(game.checkVictoryConditions(for: .cross))
        XCTAssertFalse(game.checkVictoryConditions(for: .cirle))
    }
    
    // We don't stop/care for this happening but still helps us validate that the win logic is self contained.
    func testBothWinningFullBoard() {
        let game = GameViewModel(storage: InMemoryStorage())
        game.boardState = [
            1,2,2,
            1,2,1,
            1,2,2
        ]
        XCTAssertTrue(game.checkVictoryConditions(for: .cross))
        XCTAssertTrue(game.checkVictoryConditions(for: .cirle))
    }
    
}
