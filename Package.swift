// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "NotchLogoKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "NotchLogoKit",
            targets: ["NotchLogoKit"]),
    ],targets: [
        .target(
            name: "NotchLogoKit",
            dependencies: []),
    ]
)
