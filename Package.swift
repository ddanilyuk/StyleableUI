// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StyleableUI",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "StyleableUI",
            targets: ["StyleableUI"]),
    ],
    targets: [
        .target(
            name: "StyleableUI",
            dependencies: []),
        .testTarget(
            name: "StyleableUITests",
            dependencies: ["StyleableUI"]),
    ]
)
