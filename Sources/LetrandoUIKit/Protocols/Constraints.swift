//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 22/10/21.
//

import UIKit

public protocol Constraints {}

public extension Constraints where Self: UIView {
    var constants: ConstraintsHelper<Self> {
        ConstraintsHelper()
    }
}
