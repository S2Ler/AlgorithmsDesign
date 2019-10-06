import SwiftUI
import SortKit
import Combine

public typealias SortableElement = Hashable & Comparable & CustomStringConvertible & Identifiable

public final class SortAnimation<Element: SortableElement>: ObservableObject
{
  private let sortAlgorithm: SortAlgorithm
  private var timer: Timer!

  public var values: [Element] {
    didSet {
      objectWillChange.send()
    }
  }

  private var valuesHistory: [[Element]] = []

  public var objectWillChange = PassthroughSubject<Void, Never>()

  public init(_ initialValues: [Element], sortAlgorithm: SortAlgorithm) {
    self.values = initialValues
    self.sortAlgorithm = sortAlgorithm

    self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [weak self] (_) in
      self?.timerLoop()
    })
  }

  public func sort() {
    sortAlgorithm.sort(values, progress: { (intermidiateResult) in
      self.addValuesToHistory(intermidiateResult)
    }) { (finalResult) in
      self.addValuesToHistory(finalResult)
    }
  }

  private func addValuesToHistory(_ values: [Element]) {
    valuesHistory.append(values)
  }

  private func timerLoop() {
    guard !valuesHistory.isEmpty else { return }
    values = valuesHistory.removeFirst()
  }
}
