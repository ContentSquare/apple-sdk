// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContentsquareSDK",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "ContentsquareSDK",
            targets: [
                "__ContentsquareSDK"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK_DYNAMIC.git", exact: "4.53.1"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.10.0"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.11.0"),
        .package(url: "https://github.com/ContentSquare/apple-core-sdk.git", exact: "0.2.4"),
        .package(url: "https://github.com/ContentSquare/ios-ui-core-sdk.git", exact: "0.2.1"),
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
            url: "https://github.com/ContentSquare/apple-sdk/releases/download/1.13.1/package.zip",
            checksum: "032a1e78fc07f24cbe35ae81f26604d97ca62afad3b3e9f7905af2324a774006"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
