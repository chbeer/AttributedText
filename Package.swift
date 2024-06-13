// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "AttributedText",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "AttributedText",
            targets: ["AttributedText"]),
    ],
    targets: [
        .target(
            name: "AttributedText"),
        .testTarget(
            name: "AttributedTextTests",
            dependencies: ["AttributedText"]),
    ]
)
