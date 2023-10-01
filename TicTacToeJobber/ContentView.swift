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
        GeometryReader { geometry in
            VStack {
                Spacer()
                headerView()
                gridView(width: geometry.size.width)
                footerView()
                Spacer()
            }
        }
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

// MARK: - Private subviews

private extension ContentView {
    
    /// Renders the scores and the status message views
    @ViewBuilder func headerView() -> some View {
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
    }
    
    /// Renders the board itself
    @ViewBuilder func gridView(width: CGFloat) -> some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: Constants.gridSpacing) {
            ForEach(0..<9) { index in
                CellView(mark: gameViewModel.mark(for: index))
                    .gridCellStyle(size: width/3 - Constants.gridSpacing)
                    .onTapGesture {
                        onCellTap(index: index)
                    }
            }
        }
    }
    
    /// Renders the restart button
    @ViewBuilder func footerView() -> some View {
        Button {
            gameViewModel.reset()
        } label: {
            Text("Restart")
        }
        .buttonStyle(PillButtonStyle())
        .padding()
    }
}

#Preview {
    ContentView()
}
