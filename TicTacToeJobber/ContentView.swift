import SwiftUI

private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct ContentView: View {
    @ObservedObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        HStack {
            Label("\(gameViewModel.leaderboard.cross)", systemImage: Mark.cross.asImageResourceString)
            Spacer()
            Label("\(gameViewModel.leaderboard.circle)", systemImage: Mark.cirle.asImageResourceString)
        }
        StatusMessageView(
            currentPlayer: gameViewModel.currentPlayer,
            winner: gameViewModel.winner
        )
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
