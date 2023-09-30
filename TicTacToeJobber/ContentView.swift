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
            ForEach(0..<9) { index in
                CellView(mark: gameViewModel.mark(for: index))
            }
        }
    }
}

#Preview {
    ContentView()
}
