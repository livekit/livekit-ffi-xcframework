// swift-tools-version: 6.2
// Generated from Rust template

import PackageDescription

let package = Package(
    name: "LiveKitFFI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .macCatalyst(.v14),
        .visionOS(.v26),
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
            url: "https://github.com/livekit/livekit-ffi-xcframework/releases/download/0.15.0/RustLiveKitFFI.xcframework.zip",
            checksum: "94d207e3c6fef2d23a70450b429c4dfbbfc9457a1d15bd231f69e94fe99f3849"
        )
    ],
    // Workaround for cargo-swift pinning uniffi_bindgen 0.31.1: its generated
    // callback `vtablePtr` isn't `nonisolated(unsafe)`, so the bindings fail the
    // Swift 6 language mode. Remove once cargo-swift ships uniffi 0.31.2
    // (antoniusnaumann/cargo-swift#102).
    swiftLanguageModes: [.v5]
)
