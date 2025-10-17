// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContentsquareSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ContentsquareSDK",
            targets: [
                "__ContentsquareSDK"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.44.1"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.7"),
        .package(url: "https://github.com/ContentSquare/apple-interim-bridge-sdk.git", exact: "0.12.0"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.9.0"),
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
            url: "https://github.com/ContentSquare/apple-sdk/releases/download/1.3.1/package.zip",
            checksum: "2b15ac668cceb7d5fcd27cbfe96b1b289fca478a69e012a7ce2a70fd8cb580f8"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
