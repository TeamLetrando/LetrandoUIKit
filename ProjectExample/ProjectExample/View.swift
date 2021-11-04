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
    
    override func didMoveToSuperview() {
        setupView()
    }
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    private func soundButtonAction() {
        print("Sound Button Action Pressed!!")
    }
}

extension Constraints where Self: ExampleView {
    var buttonHeight: CGFloat = 50
    var buttonWidht: CGFloat = 50
}
