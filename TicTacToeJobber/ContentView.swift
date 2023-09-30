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
                Image(systemName: index % 2 == 1 ? "xmark" : "circle")
                    .frame(width: 100, height: 100)
                    .background(Color.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
