//
//  GreenViewControllerFactory.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import Foundation
import RouteComposer

final class GreenViewControllerFactory: Factory {

    typealias ViewController = GreenViewController
    typealias Context = String

    private let router: Router
    private let factory: NavigationStepFactory

    init(router: Router, factory: NavigationStepFactory) {
        self.router = router
        self.factory = factory
    }

    func build(with context: String) throws -> GreenViewController {
        return GreenViewController(router: router, factory: factory)
    }

}
