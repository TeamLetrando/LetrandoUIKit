//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 21/10/21.
//

import UIKit

public class ConstraintsHelper<View> where View: UIView {
    public lazy var screenSize = UIScreen.main.bounds.size
    public lazy var height: CGFloat = screenSize.height / 812
    public lazy var width: CGFloat = screenSize.width / 375
    
    public lazy var horizontalMargins: CGFloat = 16 * width
}
