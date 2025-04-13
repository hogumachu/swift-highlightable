// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "swift-highlightable",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
  ],
  products: [
    .library(
      name: "Highlightable",
      targets: ["Highlightable"]
    ),
  ],
  targets: [
    .target(
      name: "Highlightable"
    ),
  ]
)
