# Generated from Rust template
Pod::Spec.new do |spec|
  spec.name = "LiveKitFFI"
  spec.version = "0.13.0"
  spec.summary = "LiveKit UniFFI bindings"
  spec.description = <<-DESC
    LiveKit UniFFI XCFramework with Swift bindings
  DESC

  spec.homepage = "https://github.com/livekit/livekit-uniffi-xcframework"
  spec.author = "LiveKit"

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"

  spec.source = {
    :git => "https://github.com/livekit/livekit-uniffi-xcframework.git",
    :tag => spec.version.to_s
  }

  spec.prepare_command = <<-CMD
    FRAMEWORK_URL="https://github.com/livekit/livekit-uniffi-xcframework/releases/download/#{spec.version}/RustLiveKitFFI.xcframework.zip"
    curl -L -o RustLiveKitFFI.xcframework.zip "$FRAMEWORK_URL"
    unzip -q RustLiveKitFFI.xcframework.zip
    rm RustLiveKitFFI.xcframework.zip
  CMD

  spec.module_name = "LiveKitFFI"
  spec.source_files = "Sources/LiveKitFFI/**/*.swift"
  spec.vendored_frameworks = "RustLiveKitFFI.xcframework"
end
