//
//  GreenViewControllerFactory.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import Foundation
import RouteComposer

final class RedViewControllerFactory: Factory {

    typealias ViewController = RedViewController
    typealias Context = String

    private let router: Router
    private let factory: NavigationStepFactory

    init(router: Router, factory: NavigationStepFactory) {
        self.router = router
        self.factory = factory
    }

    func build(with context: String) throws -> RedViewController {
        return RedViewController(router: router, factory: factory)
    }

}
