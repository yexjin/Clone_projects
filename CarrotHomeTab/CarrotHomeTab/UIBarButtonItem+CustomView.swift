//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by 오예진 on 2022/10/19.
//

import Foundation
import UIKit


extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat?) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
        
        if let width = width {
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
    }
}
