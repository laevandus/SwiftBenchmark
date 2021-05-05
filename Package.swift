// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SwiftBenchmark",
    products: [
        .executable(
            name: "SwiftBenchmark",
            targets: ["SwiftBenchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftBenchmark",
            dependencies: [.product(name: "CollectionsBenchmark", package: "swift-collections-benchmark")])
    ]
)
