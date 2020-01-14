import Foundation

public struct SelectionSort: SortAlgorithm {
  public var name: String { "Selection Sort" }

  public init() {}

  public func sort<Element: Comparable>(_ input: [Element],
                                        progress: @escaping ([Element]) -> Void,
                                        sorted: @escaping ([Element]) -> Void) {
    var input = input

    for insertIndex in 0..<(input.count - 1) {
      var minimumIndex = insertIndex
      for checkIndex in insertIndex..<input.count {
        if input[checkIndex] < input[minimumIndex] {
          minimumIndex = checkIndex
        }
      }
      swap(in: &input, idx1: insertIndex, idx2: minimumIndex)
      progress(input)
      input
    }
    sorted(input)
  }

  private func swap<Element: Comparable>(in input: inout [Element], idx1: Int, idx2: Int) {
    guard idx1 != idx2 else {
      return
    }

    let tmp = input[idx1]
    input[idx1] = input[idx2]
    input[idx2] = tmp
  }
}
