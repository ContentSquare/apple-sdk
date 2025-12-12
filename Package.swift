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
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.45.4"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.8.8"),
        .package(url: "https://github.com/ContentSquare/apple-interim-bridge-sdk.git", exact: "0.14.0"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.10.1"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.1")
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
            url: "https://github.com/ContentSquare/apple-sdk/releases/download/1.5.3/package.zip",
            checksum: "5575e86427bd4d472f31615a54ba6cb4a98cd0805f66e093124c0054aad4f8b7"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
