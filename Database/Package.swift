// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Database",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(name: "Database", targets: ["Database"]),
        .executable(name: "DatabaseBuilder", targets: ["DatabaseBuilder"])
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", exact: "10.47.0")
    ],
    targets: [
        .target(
            name: "Database",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")
            ],
            resources: [
                .process("./Resources")
            ]
        ),
        .executableTarget(
            name: "DatabaseBuilder",
            dependencies: [
                "Database"
            ]
        )
    ]
)
