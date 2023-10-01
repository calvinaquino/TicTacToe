import SwiftUI

// because we are using a grid cell nested into a geometry reader and the cell size depends on the screen's width,
// It was difficu;t to style the grid cell inside the view itself.
// Instead, this approach allowed a simpler code and reduced footprint at the ContentView's body.
struct GridCellStyleModifier: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: size, height: size)
            .background {
                Color.teal
            }
            .cornerRadius(size / 10)
    }
}

extension View {
    /// Sets the colors, frame sizes and corner radius, these last two being based off the `size` parameter.
    ///
    /// - Parameter size: The desired cell size
    func gridCellStyle(size: CGFloat) -> some View {
        modifier(GridCellStyleModifier(size: size))
    }
}
