import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: [
        .remote(url: "https://github.com/ekazaev/route-composer", requirement: .upToNextMajor(from: "2.8.2"))
    ],
    platforms: [.iOS]
)
