//
//  View.swift
//  ProjectExample
//
//  Created by Ronaldo Gomes on 03/11/21.
//

import UIKit
import LetrandoUIKit

class ExampleView: UIView, ViewCodable {
    private lazy var roundedButton = RoundedButton(backgroundImage: .add, buttonAction: nil, tintColor: .greenActionLetrando)
    
    private lazy var soundButton = SoundButton(soundOffImage: UIImage(named: "handButtonOff"), soundOnImage: UIImage(named: "handButtonOn"), isSoundOn: false, buttonAction: soundButtonAction)
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = .set(size: 20, textStyle: .headline)
        label.numberOfLines = 0
        label.textColor = .pinkBaby
        return label
    }()
    
    override func didMoveToSuperview() {
        setupView()
    }
    
    func buildViewHierarchy() {
        addSubviews(roundedButton, soundButton, messageLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            roundedButton.widthAnchor.constraint(equalToConstant: constants.buttonWidht),
            roundedButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight),
            roundedButton.leftAnchor.constraint(equalTo: leftAnchor, constant: constants.roundendButtonLeftAnchor),
            roundedButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            soundButton.widthAnchor.constraint(equalToConstant: constants.buttonWidht),
            soundButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight),
            soundButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -constants.horizontalMargins),
            soundButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: soundButton.bottomAnchor, constant: constants.verticalMargin),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constants.verticalMargin),
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: constants.verticalMargin),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -constants.verticalMargin)
        ])
    }
    
    func setupAditionalChanges() {
        backgroundColor = .transparentLightBlue
    }
    
    private func soundButtonAction() {
        print("Sound Button Action Pressed!!")
        DispatchQueue.main.async { [weak self] in
            self?.messageLabel.textColor = .random(from: [.transparentLightBlue, .lightGreenBackgroundLetrando, .customBrown, .greenActionLetrando, .greenBackgroundLetrando, .darkGreenLetrando, .purpleCustom, .blueCustom, .yellowCustom, .pinkBaby, .redCustom])
        }
    }
}

extension ConstraintsHelper where View: ExampleView {
    var buttonHeight: CGFloat { 50 * heightMultiplier }
    var buttonWidht: CGFloat { 50 * widthMultiplier }
    var roundendButtonLeftAnchor: CGFloat { 20 * widthMultiplier }
    var verticalMargin: CGFloat { 25 * heightMultiplier }
}
