// swift-tools-version: 6.0
// Generated from Rust template

import PackageDescription

let package = Package(
    name: "LiveKitFFI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v14),
        .tvOS(.v17),
    ],
    products: [
        .library(
            name: "LiveKitFFI",
            targets: ["LiveKitFFI"]
        )
    ],
    targets: [
        .target(
            name: "LiveKitFFI",
            dependencies: ["RustLiveKitFFI"]
        ),
        .binaryTarget(
            name: "RustLiveKitFFI",
            url: "https://github.com/livekit/livekit-uniffi-xcframework/releases/download/0.13.0/RustLiveKitFFI.xcframework.zip",
            checksum: "aa80fab32a54e0fd28ec9f27c92064e6f32aa1636bcc43ba2f74797cd24ae290"
        )
    ],
    // Workaround for cargo-swift pinning uniffi_bindgen 0.31.1: its generated
    // callback `vtablePtr` isn't `nonisolated(unsafe)`, so the bindings fail the
    // Swift 6 language mode. Remove once cargo-swift ships uniffi 0.31.2
    // (antoniusnaumann/cargo-swift#102).
    swiftLanguageModes: [.v5]
)
