import SwiftUI
import SortAnimation
import SortKit

extension Int: Identifiable {
  public var id: Int { return self }
}

struct ContentView: View {
  var body: some View {
    HStack {
      SortAnimationView(SortAnimation([6,4,3,2,1], sortAlgorithm: InsertionSort()))
    }.animation(.linear)
  }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(input: Inputs())
//    }
//}
