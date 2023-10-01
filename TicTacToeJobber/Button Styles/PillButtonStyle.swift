import SwiftUI

/// A simple button style with rounded corners and extran horizontal padding.
struct PillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.horizontal, 10)
            .background(Color.orange)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

#Preview {
    Button(action: {}, label: {
        Text("Button")
    })
    .buttonStyle(PillButtonStyle())
}
