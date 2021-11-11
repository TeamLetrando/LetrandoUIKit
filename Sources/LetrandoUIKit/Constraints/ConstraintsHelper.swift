//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 21/10/21.
//

import UIKit

/// This struct provides some common project constraints, which are used together with the Constraints protocol to provide these computed variables as an extension of the UIView.
/// Also, it has the height and width in the value that must be multiplied to fit the different screen sizes. In this case the default size is iphone 11, however this attribute can be overwritten for different sizes.
/// It can be used as a normal extension, and that way the declared values will work for all views. If the view is specified after the where clause, it will only work for this specific view.
public struct ConstraintsHelper<View> where View: UIView {
    public var screenSize: CGSize { UIScreen.main.bounds.size }
    public var heightMultiplier: CGFloat { screenSize.height / 812 }
    public var widthMultiplier: CGFloat { screenSize.width / 375 }
    
    public var horizontalMargins: CGFloat { 16 * widthMultiplier }
}
