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
            url: "https://github.com/livekit/livekit-uniffi-xcframework/releases/download/0.13.1/RustLiveKitFFI.xcframework.zip",
            checksum: "9c6fca694df24f1206897c5787c001120c27e03a2b28688af76c83ea79a45805"
        )
    ],
    // Workaround for cargo-swift pinning uniffi_bindgen 0.31.1: its generated
    // callback `vtablePtr` isn't `nonisolated(unsafe)`, so the bindings fail the
    // Swift 6 language mode. Remove once cargo-swift ships uniffi 0.31.2
    // (antoniusnaumann/cargo-swift#102).
    swiftLanguageModes: [.v5]
)
