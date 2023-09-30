import SwiftUI

/// A view that visually represents a mark in the grid.
///
/// - Parameter mark: An optional parameter used to render the mark's symbol. renders an empty square if nil.
struct CellView: View {
    let mark: Mark?
    
    var body: some View {
        Group {
            if let mark {
                Image(systemName: mark.asImageResourceString)
            } else {
                Image(uiImage: .init()) // empty
            }
        }
            .font(.system(size: 50))
    }
}


#Preview {
    ContentView()
}
