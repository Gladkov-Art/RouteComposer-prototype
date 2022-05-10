//
//  NavigationConfiguration.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import Foundation
import RouteComposer
import ChildModuleA
import UIKit

final class NavigationStepFactory {

    var root1: DestinationStep<RootViewController, Any?> {
        let router = router
        return StepAssembly(
            finder: ClassFinder<RootViewController, Any?>(),
            factory: InlineFactory(viewController: RootViewController(router: router, factory: self))
        )
            .using(GeneralAction.replaceRoot())
            .from(GeneralStep.root())
            .assemble()
    }

    var green: DestinationStep<GreenViewController, String> {
        StepAssembly(
            finder: ClassFinder<GreenViewController, String>(),
            factory: GreenViewControllerFactory(router: router, factory: self)
        )
        .using(UINavigationController.push())
        .from(root1.expectingContainer())
        .assemble()
    }

    var red: DestinationStep<RedViewController, String> {
        StepAssembly(
            finder: ClassFinder<RedViewController, String>(),
            factory: RedViewControllerFactory(router: router, factory: self)
        )
        .using(UINavigationController.push())
        .from(green.expectingContainer())
        .assemble()
    }

    var child1: DestinationStep<UIViewController, String> {
        let factory = ChildModuleNavigationFactory(from: red.unsafelyRewrapped(), router: router)
        return factory.child1
    }

    private let router: Router

    init(router: Router) {
        self.router = router
    }

}
