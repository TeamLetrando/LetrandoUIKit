//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 20/10/21.
//

import UIKit

public class SoundButton: UIView, ViewCodable {

    private var soundOffImage: UIImage?
    private var soundOnImage: UIImage?
    private var isSoundOn: Bool?
    private var buttonAction: (() -> Void)?

    private lazy var roundedButton: RoundedButton = {
        let button = RoundedButton(backgroundImage: (isSoundOn ?? false) ? soundOnImage : soundOffImage,
                                   buttonAction: soundButtonAction,
                                   tintColor: .greenActionLetrando)
        return button
    }()
    
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
            roundedButton.topAnchor.constraint(equalTo: topAnchor),
            roundedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func soundButtonAction() {
        buttonAction?()

        isSoundOn?.toggle()
        roundedButton.setBackgroundImage((isSoundOn ?? false) ? soundOnImage : soundOffImage, for: .normal)
        layoutSubviews()
    }
}
