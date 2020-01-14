import Foundation

public struct InsertionSort: SortAlgorithm {
  public var name: String { "Insertion Sort" }

  public init() {}

  public func sort<Element: Comparable>(_ input: [Element],
                                        progress: @escaping ([Element]) -> Void,
                                        sorted: @escaping ([Element]) -> Void) {
    var input = input
    for i in 1..<input.count {
      for j in (1...i).reversed() {
        if input[j] < input[j-1] {
          input.swapAt(j, j-1)
          progress(input)
        }
        else {
          break
        }
      }
    }
    sorted(input)
  }
}
