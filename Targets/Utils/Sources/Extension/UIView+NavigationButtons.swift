//
//  UIView+NavigationButtons.swift
//  NavigationExample
//
//  Created by Artem Gladkov on 09.05.2022.
//  Copyright © 2022 io.gladkov. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    public func addNavigationButtons(_ buttons: [UIView]) {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

}
