//
//  File.swift
//  
//
//  Created by Ronaldo Gomes on 20/10/21.
//

import UIKit

public class SoundButton: UIView, ViewCodable {

    private var currentBackgroundImage: UIImage?
    private var buttonAction: (() -> UIImage?)

    private lazy var roundedButton: RoundedButton = {
        let button = RoundedButton(backgroundImage: currentBackgroundImage,
                                   buttonAction: setAudio,
                                   tintColor: .greenActionLetrando)
        button.setBackgroundImage(currentBackgroundImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(backgroundImage: UIImage?, buttonAction: @escaping (() -> UIImage?)) {
        currentBackgroundImage = backgroundImage
        self.buttonAction = buttonAction
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMoveToSuperview() {
        setupView()
    }

    // Jogar completion
    // Buttons configuration - UIAction
    @objc private func setAudio() {
//        UserDefaults.standard.set(!Sounds.checkAudio(), forKey:LocalizableBundle.userDefautlsKeySound.localize)
//
//        Sounds.checkAudio() ? Sounds.playAudio() : Sounds.audioFinish()
        
        //buttonAction
        
        let image = buttonAction()

        roundedButton.setBackgroundImage(currentBackgroundImage, for: .normal)
        layoutSubviews()
    }

    public func buildViewHierarchy() {
        addSubview(roundedButton)
    }

    public func setupConstraints() {
        NSLayoutConstraint.activate([
            roundedButton.topAnchor.constraint(equalTo: topAnchor),
            roundedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
