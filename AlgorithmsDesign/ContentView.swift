import SwiftUI
import SortAnimation
import SortKit

struct ContentView: View {
  var body: some View {
    NavigationView {
      SortAlgorithmsList()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .frame(minWidth: 500, idealWidth: 600, maxWidth: .infinity, minHeight: 400, idealHeight: 500, maxHeight: .infinity, alignment: .center)
    }
}
