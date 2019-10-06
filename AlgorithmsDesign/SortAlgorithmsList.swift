import SwiftUI
import SortKit
import SortAnimation

public struct SortAlgorithmsList: View {
  public var body: some View {
    List(sortAlgorithmViewModels) { algorithmViewModel in
      NavigationLink(destination: SortAnimationContentView(sortAlgorithm: algorithmViewModel.algorithm, initialElement: [4,3,2,5,7,6,6])) {
        Text(algorithmViewModel.name)
      }
    }
  }
}
