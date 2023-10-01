import SwiftUI

/// Convenience view that represents a mark's score.
///
/// - Parameter mark: The mark related to the score.
/// - Parameter score: The actual score value for that mark.
struct ScoreView: View {
    let mark: Mark
    let score: Int
    
    var body: some View {
        Label("\(score)", systemImage: mark.asImageResourceString)
        .font(.title2)
    }
}

#Preview {
    HStack {
        ScoreView(mark: .cirle, score: 10)
        ScoreView(mark: .cross, score: 10)
    }
}
