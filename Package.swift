// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rotoscope",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v13)],
    products: [
        .library(
            name: "Rotoscope",
            targets: ["Rotoscope"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Rotoscope",
            dependencies: []),
        .testTarget(
            name: "RotoscopeTests",
            dependencies: ["Rotoscope"]),
    ]
)
