import SwiftUI

@available(macOS 10.15, *)
public extension View {
    @inlinable
    func withNotchLogo(
        _ title: LocalizedStringKey,
        imageName: String? = nil,
        backgroundColor: Color
    ) -> some View {
        #if os(iOS)
        modifier(NotchLogoViewModifier(
            title: title,
            imageName: imageName,
            backgroundColor: backgroundColor
        ))
        #else
        self
        #endif
    }
}
