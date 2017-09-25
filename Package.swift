// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftyStripe",
    products: [
        .library(
            name: "SwiftyStripe",
            targets: ["SwiftyStripe"]),
        ],
    dependencies: [
        .package(url: "https://github.com/mxcl/PromiseKit.git", from: "4.4.1")
    ],
    targets: [
        .target(
            name: "SwiftyStripe",
            dependencies: ["PromiseKit"],
            path: "./Sources/SwiftyStripe/"),
        .testTarget(
            name: "SwiftyStripeTests",
            dependencies: ["SwiftyStripe"]),
        ]
)
