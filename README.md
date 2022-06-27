# StackyText

[![Version](https://img.shields.io/cocoapods/v/StackyText.svg?style=flat)](https://cocoapods.org/pods/StackyText)
[![License](https://img.shields.io/cocoapods/l/StackyText.svg?style=flat)](https://cocoapods.org/pods/StackyText)
[![Platform](https://img.shields.io/cocoapods/p/StackyText.svg?style=flat)](https://cocoapods.org/pods/StackyText)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13 higher
- Swift 5.0 higher

## Installation

StackyText is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StackyText'
```

# Usage

### To support dynamic types

```swift
adjustsFontForContentSizeCategory = true
```
### OR...

![image](https://user-images.githubusercontent.com/70251136/175895805-9a9853e6-ffcb-45c1-a7bc-5c3c5583f2ce.png)

## Normal Text
```swift
let label = UILabel()

label.adjustsFontForContentSizeCategory = true

label.text = "NotoSans_Black"
label.textColor = .black
label.textColor = .black
label.font = .withFontFamilyName(name: "NotoSansKR", type: .black, dynamic: .title1)

// OR...

label.font = withFontName("NotoSansKR-Black", dynamic: .title1)
```

## AttributedString Stacky Text
```swift
let label = UILabel()

label.adjustsFontForContentSizeCategory = true

stackLabel.textColor = .black
stackLabel.attributedText = NSMutableAttributedString()
     .text("Noto", fontName: "NotoSansKR", type: .black, dynamic: .title1)
     .text("Sans", fontName: "NotoSansKR", type: .thin, dynamic: .body)
     .colorText("K", fontName: "NotoSansKR", type: .bold, dynamic: .largeTitle, color: .systemBlue)
     .colorText("R", fontName: "NotoSansKR", type: .regular, dynamic: .largeTitle, color: .systemRed)
```

## Simulator
|Normal|Dynamic Type|
|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/70251136/175892745-b7109ffa-8a42-4051-89d9-ded6f32c8818.png" width="300">|<img src="https://user-images.githubusercontent.com/70251136/175894207-f31fcad1-22db-4d35-aa12-aa7e97a21716.gif" width="300">|


## Author

yim2627, yim2627@gmail.com

## License

StackyText is available under the MIT license. See the LICENSE file for more info.
