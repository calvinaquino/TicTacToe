import SwiftUI

private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct ContentView: View {
    @ObservedObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Constants.boardRange, id: \.self) { index in
                CellView(mark: gameViewModel.mark(for: index))
            }
        }
    }
}

#Preview {
    ContentView()
}
