#if os(iOS)
import SwiftUI

public struct NotchLogoViewModifier: ViewModifier {
    let title: LocalizedStringKey
    let imageName: String?
    let backgroundColor: Color

    public init(title: LocalizedStringKey, imageName: String? = nil, backgroundColor: Color = .accentColor) {
        self.title = title
        self.imageName = imageName
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                content
                let notchHeight = proxy.safeAreaInsets.top
                HStack(spacing: 2) {
                    if let imageName {
                        Image(imageName)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 13, height: 13, alignment: .center)
                    }
                    Text(title)
                }
                .font(.system(size: 13, weight: .bold))
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .padding(4)
                .frame(maxWidth: 120, alignment: .center)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .offset(y: offset(notchHeight: notchHeight))
                .edgesIgnoringSafeArea(.top)
                .opacity(notchHeight > 24 ? 1 : 0)
            }
        }
    }

    private func offset(notchHeight: CGFloat) -> CGFloat {
        switch notchHeight {
        case 0...47:
            return 6
        default:
            return 15
        }
    }
}
#endif
