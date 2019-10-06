import SwiftUI
import SortKit
import Combine

public typealias SortableElement = Hashable & CustomStringConvertible & Identifiable

public final class SortAnimation<Element: SortableElement, Algorithm: SortAlgorithm>: ObservableObject
  where Algorithm.Element == Element
{
  private let sortAlgorithm: Algorithm
  private var timer: Timer!

  public var values: [Element] {
    didSet {
      objectWillChange.send()
    }
  }

  private var valuesHistory: [[Element]] = []

  public var objectWillChange = PassthroughSubject<Void, Never>()

  public init(_ initialValues: [Element], sortAlgorithm: Algorithm) {
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

public struct SortAnimationView<Element: SortableElement, Algorithm: SortAlgorithm>: View
  where Algorithm.Element == Element
{
  @ObservedObject var sortAnimation: SortAnimation<Element, Algorithm>

  public init(_ sortAnimation: SortAnimation<Element, Algorithm>) {
    self.sortAnimation = sortAnimation
  }

  public var body: some View {
    VStack {
      HStack {
        ForEach(sortAnimation.values) { i in
          Text("\(i.description)")
        }
      }.animation(.linear)

      Button(action: { self.sortAnimation.sort() }) {
        Text("Sort")
      }
    }
  }
}
