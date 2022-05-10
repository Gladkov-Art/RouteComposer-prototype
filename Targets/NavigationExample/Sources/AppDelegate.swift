//
//  AppDelegate.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import UIKit
import RouteComposer

@main
final class AppDelegate: NSObject, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        window.rootViewController = makeRootViewController()
        window.makeKeyAndVisible()

        return true
    }

    private func makeRootViewController() -> UIViewController? {
        let router = DefaultRouter(logger: DefaultLogger(.verbose))
        let factory = NavigationStepFactory(router: router)

        var completeFactory = CompleteFactoryAssembly(factory: NavigationControllerFactory())
            .with(RootViewControllerFactory(router: router, factory: factory), using: UINavigationController.push())
            .assemble()

        try? completeFactory.prepare()
        return try? completeFactory.build()
    }

}
