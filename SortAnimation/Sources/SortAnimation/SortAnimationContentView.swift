import SwiftUI
import SortKit

public struct SortAnimationContentView<Element: SortableElement>: View {
  private let initialElement: [Element]

  public let sortAlgorithm: SortAlgorithm

  public init(sortAlgorithm: SortAlgorithm, initialElement: [Element]) {
    self.sortAlgorithm = sortAlgorithm
    self.initialElement = initialElement
  }

  public var body: some View {
    HStack {
      SortAnimationView(SortAnimation(initialElement, sortAlgorithm: sortAlgorithm))
    }
  }
}
