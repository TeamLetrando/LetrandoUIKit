//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 15/10/21.
//

import UIKit

public extension UIView {
    /// This function allows adding multiple views as subviews at the same time.
    /// Also, if this function is used, the translatesAutoresizingMaskIntoConstraints parameter will be set to false, as this function must be used when using the view code, so this parameter must be false
    /// - Parameter views: All the views. 
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}

extension UIView: Constraints {}
