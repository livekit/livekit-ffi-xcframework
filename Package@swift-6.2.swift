// swift-tools-version: 6.2
// Generated from Rust template

import PackageDescription

let package = Package(
    name: "LiveKitUniFFI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v14),
        .visionOS(.v26),
        .tvOS(.v17),
    ],
    products: [
        .library(
            name: "LiveKitUniFFI",
            targets: ["LiveKitUniFFI"]
        )
    ],
    targets: [
        .target(
            name: "LiveKitUniFFI",
            dependencies: ["RustLiveKitUniFFI"]
        ),
        .binaryTarget(
            name: "RustLiveKitUniFFI",
            url: "https://github.com/livekit/livekit-uniffi-xcframework/releases/download/0.3.0/RustLiveKitUniFFI.xcframework.zip",
            checksum: "666956e7a29c5733d7c610108669a3e1fdc831e8c242582dee57c642c637952e"
        )
    ],
    // Workaround for cargo-swift pinning uniffi_bindgen 0.31.1: its generated
    // callback `vtablePtr` isn't `nonisolated(unsafe)`, so the bindings fail the
    // Swift 6 language mode. Remove once cargo-swift ships uniffi 0.31.2
    // (antoniusnaumann/cargo-swift#102).
    swiftLanguageModes: [.v5]
)
