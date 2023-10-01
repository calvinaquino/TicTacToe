import SwiftUI

private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct ContentView: View {
    @ObservedObject private var gameViewModel = GameViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        HStack {
            ScoreView(mark: .cross, score: gameViewModel.leaderboard.cross)
            Spacer()
            ScoreView(mark: .cirle, score: gameViewModel.leaderboard.circle)
        }
        .padding(.horizontal)
        StatusMessageView(
            currentPlayer: gameViewModel.currentPlayer,
            winner: gameViewModel.winner
        )
        .padding()
        LazyVGrid(columns: columns) {
            ForEach(Constants.boardRange, id: \.self) { index in
                CellView(mark: gameViewModel.mark(for: index))
                    .frame(width: 100, height: 100)
                    .background(Color.teal)
                    .onTapGesture {
                        onCellTap(index: index)
                    }
            }
        }
        Button {
            gameViewModel.reset()
        } label: {
            Text("Restart")
        }
        .buttonStyle(PillButtonStyle())
        .padding()
        .onChange(of: scenePhase) { newPhase in
            // Save the game state on background
            if newPhase == .background {
                gameViewModel.save()
            }
        }
    }
}

// MARK: - Private functions

private extension ContentView {
    func onCellTap(index: Int) {
        gameViewModel.markCell(at: index)
    }
}

#Preview {
    ContentView()
}
