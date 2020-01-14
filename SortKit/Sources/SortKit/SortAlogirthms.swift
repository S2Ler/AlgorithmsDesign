import SwiftUI

public struct SortAlgorithmViewModel: Hashable, Identifiable {
  public let name: String
  public let algorithm: SortAlgorithm
  public var id: String { name }

  public init(_ algorithm: SortAlgorithm) {
    self.name = algorithm.name
    self.algorithm = algorithm
  }

  public static func ==(lhs: SortAlgorithmViewModel, rhs: SortAlgorithmViewModel) -> Bool {
    return lhs.name == rhs.name
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(name)
  }
}


public let sortAlgorithmViewModels: [SortAlgorithmViewModel] = [
  .init(SystemSort()),
  .init(InsertionSort()),
  .init(SelectionSort()),
]
