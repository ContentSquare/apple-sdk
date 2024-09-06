// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Contentsquare",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v13),
        .watchOS(.v5),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "Contentsquare", targets: [
            "Contentsquare",
        ]),
    ],
    dependencies: [
        .package(url: "https://github.com/ContentSquare/CS_iOS_SDK.git", exact: "4.35.1"),
        .package(url: "https://github.com/heap/heap-swift-core-sdk.git", exact: "0.7.1"),
        .package(url: "https://github.com/heap/heap-ios-cs-integration-sdk.git", exact: "0.7.1"),
        .package(url: "https://github.com/heap/heap-ios-autocapture-sdk.git", exact: "0.7.0"),
        .package(url: "https://github.com/heap/heap-notification-autocapture-sdk.git", exact: "0.7.0"),
    ],
    targets: [
        .target(
            name: "Contentsquare",
            dependencies: [
                .product(name: "ContentsquareModule", package: "CS_iOS_SDK", condition: .when(platforms: [ .iOS ])),
                .product(name: "HeapContentsquareIntegrationSDK", package: "heap-ios-cs-integration-sdk", condition: .when(platforms: [ .iOS ])),
                .product(name: "HeapIOSAutocapture", package: "heap-ios-autocapture-sdk", condition: .when(platforms: [ .iOS, .macCatalyst ])),
                .product(name: "HeapNotificationAutocapture", package: "heap-notification-autocapture-sdk", condition: .when(platforms: [ .iOS, .macCatalyst, .macOS, .watchOS ])),
                .product(name: "HeapSwiftCore", package: "heap-swift-core-sdk"),
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
