import SwiftUI

public struct SortAnimationView<Element: SortableElement>: View
{
  @ObservedObject var sortAnimation: SortAnimation<Element>

  public init(_ sortAnimation: SortAnimation<Element>) {
    self.sortAnimation = sortAnimation
  }

  public var body: some View {
    VStack {
      HStack {
        ForEach(sortAnimation.values) { i in
          Text("\(i.description)")
        }
        Spacer()
      }
      .animation(.linear)

      Button(action: { self.sortAnimation.sort() }) {
        Text("Sort")
      }
      Spacer()
    }
  }
}
