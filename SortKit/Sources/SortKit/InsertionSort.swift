import Foundation

public struct InsertionSort<Element: Comparable>: SortAlgorithm {
  public typealias Element = Element

  public init() {}

  public func sort(_ input: [Element], progress: @escaping ([Element]) -> Void, sorted: @escaping ([Element]) -> Void) {
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
