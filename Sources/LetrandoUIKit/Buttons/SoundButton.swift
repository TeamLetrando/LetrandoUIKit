//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 20/10/21.
//

import UIKit

/// This class represents the round sound button. It is not a UIButton, but contains its behavior.
public class SoundButton: UIView, ViewCodable {
    
    /// Images of buttons when they are on and off
    private var soundOffImage: UIImage?
    private var soundOnImage: UIImage?
    private var isSoundOn: Bool?
    private var buttonAction: (() -> Void)?
    
    /// The real button inside this view
    private lazy var roundedButton: RoundedButton = {
        let button = RoundedButton(backgroundImage: (isSoundOn ?? false) ? soundOnImage : soundOffImage,
                                   buttonAction: soundButtonAction,
                                   tintColor: .greenActionLetrando)
        return button
    }()
    
    /// - Parameters:
    ///   - soundOffImage: Image using when the sound are off. Can be optional
    ///   - soundOnImage: Image using when the sound are on. Can be optional
    ///   - isSoundOn: Boolean that must be passed informing if the sound is currently on or off. If it is nil, its use will always be considered false.
    ///   - buttonAction: Action optinal of button
    public init(soundOffImage: UIImage?,
         soundOnImage: UIImage?,
         isSoundOn: Bool?,
         buttonAction: (() -> Void)?) {
        self.soundOffImage = soundOffImage
        self.soundOnImage = soundOnImage
        self.isSoundOn = isSoundOn
        self.buttonAction = buttonAction
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMoveToSuperview() {
        setupView()
    }

    public func buildViewHierarchy() {
        addSubviews(roundedButton)
    }

    public func setupConstraints() {
        NSLayoutConstraint.activate([
            // Fill all the button
            roundedButton.topAnchor.constraint(equalTo: topAnchor),
            roundedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func soundButtonAction() {
        buttonAction?()

        /// Every time the Boolean of the sound is changed to have the current value for the exchange of images
        isSoundOn?.toggle()
        roundedButton.setBackgroundImage((isSoundOn ?? false) ? soundOnImage : soundOffImage, for: .normal)
        layoutSubviews()
    }
}
