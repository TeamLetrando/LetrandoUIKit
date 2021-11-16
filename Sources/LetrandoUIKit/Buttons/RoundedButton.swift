//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 15/10/21.
//

import UIKit

/// This class represents a round button used in Letrando
public class RoundedButton: UIButton {
    
    /// The button's action, which must be passed via the constructor. The button may or may not have action, so it is optional.
    private var buttonAction: (() -> Void)?
    
    /// - Parameters:
    ///   - backgroundImage: The possible background image of the button
    ///   - buttonAction: The possible action of the button
    ///   - tintColor: The background color of the button fill
    public init(backgroundImage: UIImage?, buttonAction: (() -> Void)?, tintColor: UIColor) {
        self.buttonAction = buttonAction
        
        super.init(frame: .zero)

        addTarget(self, action: #selector(setButtonAction), for: .touchUpInside)
        setColorsAndImagesBackground(with: backgroundImage, and: tintColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setColorsAndImagesBackground(with image: UIImage?, and color: UIColor) {
        tintColor = color
        backgroundColor = .white
        layer.borderColor = UIColor.white.cgColor
        setBackgroundImage(image, for: .normal)
    }
    
    @objc private func setButtonAction() {
        buttonAction?()
        animateButton()
    }
    
    private func animateButton() {
        let buttonCenter = center
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.frame.size.width -= 3
            self?.frame.size.height -= 3
            self?.center = buttonCenter
        })
    }
    
    public override func setNeedsLayout() {
        super.setNeedsLayout()
        
        layer.borderWidth = frame.size.width * constants.widthMultiplier
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }
}

