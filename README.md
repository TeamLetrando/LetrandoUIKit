# LetrandoUIKit

[![SPM ready](https://img.shields.io/badge/SPM-ready-orange.svg)](https://swift.org/package-manager/)

# Overview

LetrandoUIKit is a framework with useful functions and extensions for creating screens in view code style.

# Requirements
- Swift 5
- iOS 13.0 or later

# Installation
## Swift Package Manager

1. In your project click: File -> Swift Packages -> Add Package Dependency...
2. Then, paste https://github.com/TeamLetrando/LetrandoUIKit.git
3. Choice Next
4. Make sure you choose the branch main

# Get started

1 - Import LetrandoUIKit framework

```swift
import LetrandoUIKit
```
2 - Use some of the functions, extensions or protocols given in the documentation


# Documentation

## Protocols

### ViewCodable

A protocol that provides base functions for using view code.
It is necessary to use it in views that will be written in view code.

```swift
class ExampleView: UIView, ViewCodable
```

In this way, the standard functions of the protocol can be used to build the hierarchy of views, build constraints and add some configuration.

IMPORTANT! For the protocol to work correctly, it is necessary to call the setupView() function in the didMoveToSuperview() method. This is done because the setupView function triggers the protocol functions in the correct order.

```swift
override func didMoveToSuperview() {
  setupView()
}
```

## Extensions

### UIColor

Provides a series of colors used in the Letrando app. Furthermore, it contains a function to return a random color from a series of colors. 

```swift
UIColor.random(from colors: [.red, .blue, .pink])
```

### UIFont

Provides a static function that configures the main parameters of a UIFont, which are the size, weight, textStyle. The weight and textStyle parameters have default values that can be used or not. Finally it returns the custom UIFont.

```swift
label.font = .set(size: 20, weight: .bold, textStyle: .headline)
```

### UIView

The addSubviews function makes it easy to add multiple views as subViews. Also, when using this function, all added views automatically have the translatesAutoresizingMaskIntoConstraints parameter set to false, as it is understood that using it is because the view code is being used.

```swift
addSubviews(roundedButton, soundButton, messageLabel)
```

It is recommended that it be used together with the ViewCodable protocol and within the buildViewHierarchy() function.

## Constraints

### ConstraintsHelper

This struct provides some common project constraints, which are used together with the Constraints protocol to provide these computed variables as an extension of the UIView.

It is possible to directly use the variables already declared when building constraints.

```swift
roundedButton.heightAnchor.constraint(equalToConstant: constants.buttonHeight)
```

However, it is also possible to declare your own constraint variables as an extension of ConstraintsHelper.

```swift
extension ConstraintsHelper where View: ExampleView {
  var roundendButtonLeftAnchor: CGFloat { 20 * widthMultiplier }
  var verticalMargin: CGFloat { 25 * heightMultiplier }
}
```

If the view is not specified in the where clause, the constraints will apply to all views created.

## Buttons

### SoundButton

This class represents the round sound button. It is not a UIButton, but contains its behavior. It receives the sound images on and off, its binding informing if it is on or not and the action of the button.

```swift
private lazy var soundButton = SoundButton(soundOffImage: UIImage(named: "handButtonOff"), soundOnImage: UIImage(named: "handButtonOn"), isSoundOn: false, buttonAction: soundButtonAction)
```

### RoundedButton

This class represents a round button used in Letrando

```swift
private lazy var roundedButton = RoundedButton(backgroundImage: .add, buttonAction: nil, tintColor: .greenActionLetrando)
```

## Example Project

Inside the package there is an example project, where everything created in the framework is used, along with more detailed documentation of the elements. 


# Want to contribute?

If you want to contribute just open an issue informing the improvement or create a pull request.

# Show your support

Give a ⭐️ if this project helped you!

# License

LetrandoUIKit is licensed under the [MIT License](https://github.com/TeamLetrando/LetrandoUIKit/blob/main/LICENSE).

