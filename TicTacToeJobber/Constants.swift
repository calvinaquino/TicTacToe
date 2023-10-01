import Foundation

enum Constants {}

// MARK: - Board definitions

extension Constants {
    /// The size of the board described by a Range of Ints.
    ///
    /// Using a Range makes it easier to work with a static number of cells considering that SwiftUI needs to identify each cell someway, so we can rely on the range element's indext (or `\.self`) for it.
    static let boardRange: Range<Int> = 0..<9
}

// MARK: - Victory Patterns

/*
 index positions
 
 0  1   2
 3  4   5
 6  7   8
 */

extension Constants {
    static let victoryPatterns: Set<Set<Int>> = [
        [0, 3, 6], // first column
        [1, 4, 7], // second column
        [2, 5, 8], // third column
        [0, 1, 2], // first row
        [3, 4, 5], // second row
        [6, 7, 8], // third row
        [2, 4, 6], // diagonal bottom left to top right
        [0, 4, 8] // diagonal top left to bottom right
    ]
}

// MARK: - Layout

extension Constants {
    static let gridSpacing: CGFloat = 10
}
