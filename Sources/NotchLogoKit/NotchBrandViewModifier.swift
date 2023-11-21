#if os(iOS)
import SwiftUI

public struct NotchLogoViewModifier: ViewModifier {
    let title: LocalizedStringKey
    let imageName: String?
    let backgroundColor: Color

    public init(title: LocalizedStringKey, imageName: String? = nil, backgroundColor: Color) {
        self.title = title
        self.imageName = imageName
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if notchHeight > 24 {
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
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .foregroundColor(.white)
                .background(backgroundColor)
                .cornerRadius(25)
                .offset(y: offset)
                .edgesIgnoringSafeArea(.top)
            }
        }
    }

    private var offset: CGFloat {
        switch notchHeight {
        case 0...47:
            return 6
        default:
            return 15
        }
    }

    private var notchHeight: CGFloat = safeAreaTop()
}
#endif
