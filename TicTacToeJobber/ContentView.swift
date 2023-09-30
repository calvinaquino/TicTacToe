import SwiftUI

private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct ContentView: View {
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<9) { index in
                CellView(mark: index % 2 == 1 ? .cross : .cirle)
            }
        }
    }
}

#Preview {
    ContentView()
}
