//
//  ChildModuleNavigation.swift
//  ChildModuleA
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import Foundation
import RouteComposer
import UIKit

public struct Child1Context {
    public var name: String
    public var surname: String
    public init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

public struct Child2Context {
    public var child1Context: Child1Context
    public var productNumber: String
    public init(productNumber: String) {
        self.productNumber = productNumber
    }
}

public final class ChildModuleNavigationFactory {

    private let initialFromStep: DestinationStep<UINavigationController, Any?>
    private let router: Router

    public var child1: DestinationStep<UIViewController, Child1Context?> {
        let router = router
        let step: DestinationStep<Child1ViewController, String> =
        StepAssembly(
            finder: ClassFinder<Child1ViewController, String>(),
            factory: InlineFactory(viewController: Child1ViewController(
                router: router,
                factory: self))
        )
        .using(UINavigationController.push())
        .from(initialFromStep.adaptingContext())
        .assemble()

        return step.unsafelyRewrapped()
    }

    public var child2: DestinationStep<UINavigationController, Child2Context> {
        StepAssembly(
            finder: ClassFinder<Child2ViewController, Child2Context>(),
            factory: InlineFactory(viewController: Child2ViewController())
        )
            .using(UINavigationController.push())
            .from(child1.unsafelyRewrapped())
            .assemble(from: child1.expectingContainer())
    }

    public init(
        from: DestinationStep<UINavigationController, Any?>,
        router: Router
    ) {
        self.initialFromStep = from
        self.router = router
    }

}
