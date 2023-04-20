import SwiftUI

public extension View {
    func withNotchLogo(
        _ title: LocalizedStringKey,
        imageName: String? = nil,
        backgroundColor: Color
    ) -> some View {
        modifier(NotchLogoViewModifier(
            title: title,
            imageName: imageName,
            backgroundColor: backgroundColor
        ))
    }
}
