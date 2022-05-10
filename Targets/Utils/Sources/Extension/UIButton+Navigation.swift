//
//  UIButton+Navigation.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    public static func makeNavigation(title: String, handler: @escaping () -> Void) -> UIButton {
        UIButton(primaryAction: .init(title: title, handler: { _ in handler() }))
    }

}
