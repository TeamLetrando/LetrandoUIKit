//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 22/10/21.
//

import UIKit

/// This protocol - extension is used to enable the struct ConstraintsHelper to be used as a parameter type of the UIView.
public protocol Constraints {}

public extension Constraints where Self: UIView {
    /// Use this variable to access the constraints declared in the ConstraintsHelper extension
    var constants: ConstraintsHelper<Self> {
        ConstraintsHelper()
    }
}
