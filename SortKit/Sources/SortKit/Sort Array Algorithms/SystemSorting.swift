import Foundation

public struct SystemSort: SortAlgorithm {
  public var name: String { "System Sort" }

  public init() {}

  public func sort<Element: Comparable>(_ input: [Element],
                                        progress: @escaping ([Element]) -> Void,
                                        sorted: @escaping ([Element]) -> Void) {
    sorted(input.sorted())
  }
}
