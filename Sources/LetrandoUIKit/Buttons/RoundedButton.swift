//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 15/10/21.
//

import UIKit

public class RoundedButton: UIButton {
    
    private var buttonAction: (() -> Void)?
    
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

    public override func layoutSubviews() {
        layer.borderWidth = constants.width * 0.7
        layer.cornerRadius = constants.width / 2
        layer.masksToBounds = true
    }
}

