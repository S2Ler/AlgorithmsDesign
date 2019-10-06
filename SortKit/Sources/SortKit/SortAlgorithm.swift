import Foundation

public protocol SortAlgorithm {
  associatedtype Element: Comparable
  func sort(_ input: [Element],
            progress: @escaping ([Element]) -> Void,
            sorted: @escaping ([Element]) -> Void)
}
