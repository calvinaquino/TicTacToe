import SwiftUI

/// A view tha presents game flow related messages like whose turn it is, or the result of a finished game, based on the parameters.
///
/// This view shows status messages with the following logic:
/// 1. "Player's turn." if there is a currentPlayer but no winner.
/// 2. "Player WINS!" if there is no currentPlayer but there IS a winner.
/// 3. "DRAW!" if all parameters are nil.
///
/// - Parameter currentPlayer: The player that owns the turn. Nil if there is no ongoing game.
/// - Parameter winner: The winner for the most recent game. Nil if there is an ongoing game OR (if currentPlayer is also nil) if there was a draw.
struct StatusMessageView: View {
    var currentPlayer: Mark?
    var winner: Mark?
    
    var body: some View {
        Group {
            if let currentPlayer {
                Label("'s turn.", systemImage: currentPlayer.asImageResourceString)
            } else if let winner {
                Label(" WINS!", systemImage: winner.asImageResourceString)
            } else {
                Text("DRAW!")
            }
        }
        .font(.headline)
    }
}

#Preview {
    VStack {
        StatusMessageView()
        StatusMessageView(currentPlayer: .cross)
        StatusMessageView(currentPlayer: .cirle)
        StatusMessageView(winner: .cross)
        StatusMessageView(winner: .cirle)
    }
}
