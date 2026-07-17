// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iterable_flutter",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "iterable-flutter", targets: ["iterable_flutter"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/Iterable/swift-sdk.git", exact: "6.7.3")
    ],
    targets: [
        .target(
            name: "iterable_flutter",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "IterableSDK", package: "swift-sdk")
            ]
        )
    ]
)
