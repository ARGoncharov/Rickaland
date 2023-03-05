//
//  Extensions.swift
//  Rickaland
//
//  Created by Алексей  on 03.03.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}
