//
//  AppDelegate.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import UIKit
import Utils
import RouteComposer

final class Child1ViewController: UIViewController {

    private let router: Router
    private let factory: ChildModuleNavigationFactory

    init(router: Router, factory: ChildModuleNavigationFactory) {
        self.router = router
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue

        let pushChild2 = UIButton.makeNavigation(title: "Push Child2") { [weak self] in
            guard let sSelf = self else { return }
            try? sSelf.router.navigate(to: sSelf.factory.)
        }
    }

}
