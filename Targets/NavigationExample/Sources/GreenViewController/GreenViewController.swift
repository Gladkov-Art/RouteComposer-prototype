//
//  GreenViewController.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import UIKit
import Utils
import RouteComposer

final class GreenViewController: UIViewController {

    private let router: Router
    private let factory: NavigationStepFactory

    init(router: Router, factory: NavigationStepFactory) {
        self.router = router
        self.factory = factory

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

        let openRed = UIButton(primaryAction: .init(title: "Push Red", handler: { [weak self] _ in
            guard let sSelf = self else { return }
            try? self?.router.navigate(to: sSelf.factory.red, with: "ddd", animated: true, completion: nil)
        }))
        view.addNavigationButtons([openRed])
    }

}
