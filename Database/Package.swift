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
    ],
    targets: [
        .target(
            name: "Database",
            dependencies: [
                "RealmBinary",
                "RealmSwift"
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
        ),
        .binaryTarget(
            name: "RealmBinary",
            url: "https://github.com/realm/realm-swift/releases/download/v10.52.0/Realm.spm.zip",
            checksum: "9e0fef06acb2ec3939a2409b6a760ddb13e3879b66d2ba704813760798902c99"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/realm/realm-swift/releases/download/v10.52.0/RealmSwift@15.2.spm.zip",
            checksum: "cea2a049a7279257f1e5e3d5a37bbc1dfd3f7f8e32974625918395019e66aea0"
        )
    ]
)
