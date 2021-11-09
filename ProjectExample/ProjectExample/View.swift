//
//  View.swift
//  ProjectExample
//
//  Created by Ronaldo Gomes on 03/11/21.
//

import UIKit
import LetrandoUIKit

class ExampleView: UIView, ViewCodable {
    
    /// Use of the class RoundedButton that receives a background image, a button action and the button color.
    /// Attributes are optionals, with the exception of the button color.
    /// In this example the button has no action, so nil is passed.
    private lazy var roundedButton = RoundedButton(backgroundImage: .add, buttonAction: nil, tintColor: .greenActionLetrando)
    
    /// Implementation of class SoundButton.
    /// Receives the images of the on and off button, as well as a Boolean informing if the sound is active from the start or not. In addition, the action of the button is passed.
    /// All attributes are optionals
    private lazy var soundButton = SoundButton(soundOffImage: UIImage(named: "handButtonOff"), soundOnImage: UIImage(named: "handButtonOn"), isSoundOn: false, buttonAction: soundButtonAction)
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = .set(size: 20, textStyle: .headline)
        label.numberOfLines = 0
        /// Use of a letrando color extension
        label.textColor = .pinkBaby
        return label
    }()
    
    /// For the correct functioning of the ViewCodable protocol it is necessary to call the setupView() function inside the didMoveToSuperview()
    /// This is because this is where the protocol call flow is done and where subviews, contraints and everything else is built.
    override func didMoveToSuperview() {
        setupView()
    }
    
    func buildViewHierarchy() {
        /// Function addSubviews which is an extension of UIView. It is allowed to add multiple views.
        /// If you use these function, you are automatically set translatesAutoresizingMaskIntoConstraints = false
        addSubviews(roundedButton, soundButton, messageLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            /// The constant variable contains some useful and common constants, such as heightMultiplier and horizontalMargins. In this case, buttonWidht is used, which was created later specifically for this screen.
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

/// This extension creates new constants to be used when building screens with view code.
/// Using where, you can specify which view you want to make these variables specific.
/// In the following example, these created variables are visible to her. If there was no where clause, the variables would be visible to all views.
/// The purpose of this extension is to put descriptive names that help in reading the code and avoid the so-called magic numbers when building views.
extension ConstraintsHelper where View: ExampleView {
    /// It is important that all constraints are multiplied by the height or width multiplier to fit any screen.
    var buttonHeight: CGFloat { 50 * heightMultiplier }
    var buttonWidht: CGFloat { 50 * widthMultiplier }
    var roundendButtonLeftAnchor: CGFloat { 20 * widthMultiplier }
    var verticalMargin: CGFloat { 25 * heightMultiplier }
}
