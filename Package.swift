// swift-tools-version:5.10
import PackageDescription

let package = Package(
  name: "PopOverAlert",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "PopOverAlert",
      targets: ["PopOverAlert"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
        name: "PopOverAlert",
        dependencies: [],
        path: "Sources"
    ),
    .testTarget(
      name: "PopOverAlertTests",
      dependencies: ["PopOverAlert"]),
  ]
)