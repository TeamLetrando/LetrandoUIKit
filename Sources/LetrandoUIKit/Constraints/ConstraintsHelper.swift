//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 21/10/21.
//

import UIKit

public struct ConstraintsHelper<View> where View: UIView {
    public var screenSize: CGSize { UIScreen.main.bounds.size }
    public var height: CGFloat { screenSize.height / 812 }
    public var width: CGFloat { screenSize.width / 375 }
    
    public var horizontalMargins: CGFloat { 16 * width }
}
