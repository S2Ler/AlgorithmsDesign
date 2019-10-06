import Foundation

public struct SystemSort<Element: Comparable>: SortAlgorithm {
  public typealias Element = Element

  public init() {}

  public func sort(_ input: [Element], progress: @escaping ([Element]) -> Void, sorted: @escaping ([Element]) -> Void) {
    progress(input.shuffled())
    sorted(input.sorted())
  }
}
