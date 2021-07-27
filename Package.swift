// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Flow",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "Flow",
            targets: ["Flow"]
        ),
    ],
    dependencies: [
        .package(name: "BigInt", url: "https://github.com/attaswift/BigInt.git", from: "5.2.1"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Flow",
            dependencies: ["BigInt",
                           .product(name: "GRPC", package: "grpc-swift")]
        ),
        .testTarget(
            name: "flowTests",
            dependencies: ["Flow"]
        ),
    ]
)
