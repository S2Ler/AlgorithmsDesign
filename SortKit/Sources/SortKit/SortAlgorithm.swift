import Foundation

public protocol SortAlgorithm {
  init()

  var name: String { get }

  func sort<Element: Comparable>(_ input: [Element],
                                 progress: @escaping ([Element]) -> Void,
                                 sorted: @escaping ([Element]) -> Void)

}
