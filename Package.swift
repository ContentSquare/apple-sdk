// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContentsquareSDK",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "ContentsquareSDK",
            targets: [
                "__ContentsquareSDK"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/djpearce/CS_iOS_SDK_DYNAMIC", branch: "patch-1"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.6"),
        .package(url: "https://github.com/djpearce/apple-interim-bridge-sdk", branch: "patch-1"),
        .package(url: "https://github.com/djpearce/heap-ios-autocapture-sdk", branch: "patch-1"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.0"),
    ],
    targets: [
        .target(
            name: "__ContentsquareSDK",
            dependencies: [
                "ContentsquareSDK",
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK_DYNAMIC"),
                .product(name: "ContentsquareInterimBridge", package: "apple-interim-bridge-sdk", condition: .when(platforms: [ .iOS ])),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk"),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk"),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk/releases/download/1.2.1/package.zip",
            checksum: "8ddd8d982d35d0887032713735a17c50df00d38393e52f77b92be65a28a780e6"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
