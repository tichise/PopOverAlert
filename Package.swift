// swift-tools-version:5.10
import PackageDescription

let package = Package(
  name: "PopOverAlert",
  platforms: [
    .iOS(.v15)
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
