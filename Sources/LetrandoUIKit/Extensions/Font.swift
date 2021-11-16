//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 20/10/21.
//

import UIKit

public extension UIFont {
    /// This function is useful to configure a specific table with the most used parameters separately
    /// - Parameters:
    ///   - size: The size of the font
    ///   - weight: The weight of the font, with standard value of bold.
    ///   - textStyle: The textStyle of the font, with standard value of largeTitle.
    /// - Returns: A custom UIFont with the parameters passed
    static func set(size: CGFloat, weight: UIFont.Weight = .bold, textStyle: UIFont.TextStyle = .largeTitle) -> UIFont {

        let customFont = systemFont(ofSize: size, weight: weight)
        
        if let fontDescriptor = customFont.fontDescriptor.withDesign(.rounded) {
            let roundedFont = UIFont(descriptor: fontDescriptor, size: size)
            return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: roundedFont)
        }
     
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
    }
}
