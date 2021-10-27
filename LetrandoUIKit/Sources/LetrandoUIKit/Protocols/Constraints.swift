//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 22/10/21.
//

import UIKit

public protocol Constraints {}

extension Constraints where Self: UIView {
    public var constants: ConstraintsHelper<Self> {
        ConstraintsHelper()
    }
}
