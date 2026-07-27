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
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.51.2"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.9.1"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.10.1"),
        .package(url: "https://github.com/ContentSquare/apple-core-sdk.git", exact: "0.1.4"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.8.3"),
    ],
    targets: [
        .target(
            name: "__ContentsquareSDK",
            dependencies: [
                "ContentsquareSDK",
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK_DYNAMIC", condition: .when(platforms: [ .iOS ])),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk", condition: .when(platforms: [ .iOS, .macCatalyst ])),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk", condition: .when(platforms: [ .iOS, .macCatalyst, .macOS, .watchOS, .visionOS ])),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
                .product(name: "ContentsquareCore", package: "apple-core-sdk"),
            ]
        ),
        .binaryTarget(
            name: "ContentsquareSDK",
            url: "https://github.com/ContentSquare/apple-sdk/releases/download/1.11.2/package.zip",
            checksum: "f1d7d1bf96bbb5e9168aa31ce2de8149aa0cb5d39d5e5d52f2ca9fed52669008"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
