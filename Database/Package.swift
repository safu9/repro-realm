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
            url: "https://github.com/realm/realm-swift/releases/download/v10.46.0/Realm.spm.zip",
            checksum: "a2d8978b65757e862af326846b550c2e314f821fb7485573b72ac18c2d20006c"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/realm/realm-swift/releases/download/v10.46.0/RealmSwift@15.2.spm.zip",
            checksum: "c429db7b2b6ea209a962930db7b28dea2134ccd7520daef9e79c6b8ca3d86a77"
        )
    ]
)
