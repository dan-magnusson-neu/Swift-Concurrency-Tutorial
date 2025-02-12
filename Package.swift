// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-Concurrency-Tutorial",
    platforms: [.macOS("13.0")],
    dependencies: [.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")],
    targets: [
        .executableTarget(name: "Swift-Concurrency-Tutorial")
    ]
)
