import UIKit

internal extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        if #available(iOS 15.0, *) {
            return (connectedScenes.first as? UIWindowScene)?.keyWindow
        } else {
            return (connectedScenes.first as? UIWindowScene)?.windows.first(where: \.isKeyWindow)
        }
    }
}

internal func safeAreaTop() -> CGFloat {
    if let window = UIApplication.shared.keyWindowInConnectedScenes {
        return window.safeAreaInsets.top
    }
    return 0
}
