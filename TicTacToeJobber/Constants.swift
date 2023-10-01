import Foundation

enum Constants {}

// MARK: - Board definitions

extension Constants {
    /// The size of the board described by a Range of Ints.
    ///
    /// Using a Range makes it easier to work with a static number of cells considering that SwiftUI needs to identify each cell someway, so we can rely on the range element's indext (or `\.self`) for it.
    static let boardRange: Range<Int> = 0..<9
}
