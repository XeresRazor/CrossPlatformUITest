// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CrossPlatformUITest",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/SwiftGameLib/SwiftGLFW.git", from: "0.0.1"),
        .package(url: "https://github.com/XeresRazor/swift-opengl.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "CrossPlatformUITest",
            dependencies: [
                .product(name: "SwiftGLFW",
                         package: "SwiftGLFW"),
                .product(name: "GL", package: "swift-opengl")
            ]),
        .testTarget(
            name: "CrossPlatformUITestTests",
            dependencies: ["CrossPlatformUITest"]),
    ]
)
