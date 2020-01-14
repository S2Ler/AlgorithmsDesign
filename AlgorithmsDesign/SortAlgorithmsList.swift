import SwiftUI
import SortKit
import SortAnimation

public struct SortAlgorithmsList: View {
  public var body: some View {
    List(sortAlgorithmViewModels) { algorithmViewModel in
      NavigationLink(destination: SortAnimationContentView(sortAlgorithm: algorithmViewModel.algorithm,
                                                           initialElement: self.generateRandomNumbers())) {
        Text(algorithmViewModel.name)
      }
    }
    .frame(minWidth: 200)
  }

  private func generateRandomNumbers() -> [Int] {
    (0..<20).map{ _ in Int.random(in: 0 ... 40) }
  }
}
