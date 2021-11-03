//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 15/10/21.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}

extension UIView: Constraints {}
