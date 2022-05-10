import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let utils = Target(
    name: "Utils",
    platform: .iOS,
    product: .staticLibrary,
    bundleId: "io.ag.utils",
    sources: [
        "Targets/Utils/Sources/**/*"
    ]
)

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
]

let childModule = Target(
    name: "ChildModuleA",
    platform: .iOS,
    product: .staticLibrary,
    bundleId: "io.ag.child-module-a",
    sources: [
        "Targets/ChildModuleA/Sources/**/*"
    ],
    dependencies: [
        .target(name: "Utils"),
        .external(name: "RouteComposer")
    ]
)

let example = Target(
    name: "NavigationExample",
    platform: .iOS,
    product: .app,
    bundleId: "io.ag.navigation-example",
    infoPlist: .extendingDefault(with: infoPlist),
    sources: [
        "Targets/NavigationExample/Sources/**/*"
    ],
    resources: [
        "Targets/NavigationExample/Resources/**/*"
    ],
    dependencies: [
        .target(name: "Utils"),
        .target(name: "ChildModuleA"),
        .external(name: "RouteComposer")
    ]
)

let project = Project(
    name: "NavigationExample",
    organizationName: "io.ag",
    targets: [example, childModule, utils],
    resourceSynthesizers: []
)
