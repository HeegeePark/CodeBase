//
//  UIView+Extension.swift
//  Netflix_Codebase
//
//  Created by 박희지 on 1/29/24.
//

import UIKit

extension UIView {
    func addSubViews(_ subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
