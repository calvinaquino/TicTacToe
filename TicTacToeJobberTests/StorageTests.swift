import XCTest
@testable import TicTacToeJobber

final class StorageTests: XCTestCase {
    
    func testStorageFlows() {
        let storage = InMemoryStorage()
        let gameSession1 = GameViewModel(storage: storage)
        gameSession1.currentPlayer = .cirle
        gameSession1.boardState = [
            0,0,1,
            2,0,2,
            1,0,0
        ]
        gameSession1.leaderboard.circle = 3
        gameSession1.leaderboard.cross = 4
        
        // Simulate App going to background
        gameSession1.save()
        
        // Initialize a new game session as if coldbooting the app
        let gameSession2 = GameViewModel(storage: storage)
        
        XCTAssertEqual(gameSession1.boardState, gameSession2.boardState)
        XCTAssertEqual(gameSession1.leaderboard.cross, gameSession2.leaderboard.cross)
        XCTAssertEqual(gameSession1.leaderboard.circle, gameSession2.leaderboard.circle)
        XCTAssertEqual(gameSession1.currentPlayer, gameSession2.currentPlayer)
        XCTAssertEqual(gameSession1.winner, gameSession2.winner)
    }
    
    
}
