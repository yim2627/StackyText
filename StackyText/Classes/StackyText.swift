// MIT LICENSE

//Copyright (c) 2022 yim2627 <yim2627@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


import UIKit

    // kind of dynamic size, style

@available(iOS 13.0, *)
public enum DynamicFont {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2

    var size: CGFloat {
        switch self {
        case .largeTitle:
            return 34
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline:
            return 18
        case .body:
            return 17
        case .callout:
            return 16
        case .subhead:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        }
    }
    
    var style: UIFont.TextStyle {
        switch self {
        case .largeTitle:
            return .largeTitle
        case .title1:
            return .title1
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .headline:
            return .headline
        case .body:
            return .body
        case .callout:
            return .callout
        case .subhead:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption1:
            return .caption1
        case .caption2:
            return .caption2
        }
    }
}

    // kind of fontFamily

public enum FontFamily: String {
    case regular = "Regular"
    case bold = "Bold"
    case medium = "Medium"
    case light = "Light"
    case semibold = "Semibold"
    case thin = "Thin"
    case black = "Black"
}

@available(iOS 13.0, *)
public extension UIFont {
    // check apply font correctly
    
    class func checkFamilyFontName() {
        for f in familyNames {
            print("\(f)")
            for n in fontNames(forFamilyName: f) {
                print("==\(n)")
            }
        }
    }
    
    // e.g.
    // lable.font = .withFontName(
    //                  name: "fontFileName",
    //                  `dynamic`: dynamicFontSize(Int))
    
    // Make sure the font file is included in the project
    // and the font name is spelled correctly
    
    class func withFontName(name: String, dynamic: DynamicFont) -> UIFont {
        guard let font = UIFont(
            name: name,
            size: dynamic.size
        ) else {
            fatalError(
                    """
                    Failed to load the "\(name)" font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                    """
            )
        }
        
        return UIFontMetrics(forTextStyle: dynamic.style)
            .scaledFont(for: font)
    }
    
    // e.g.
    // lable.font = .withFontfFamilyName(
    //                  name: "fontFileName",
    //                  type: customType,
    //                  `dynamic`: dynamicFontSize(Int))
    
    // Make sure the font file is included in the project
    // and the font name is spelled correctly
    
    class func withFontFamilyName(name: String, type: FontFamily, dynamic: DynamicFont) -> UIFont {
        let fontName: String = "\(name)-\(type.rawValue)"
        
        guard let font = UIFont(
            name: fontName,
            size: dynamic.size
        ) else {
            fatalError(
                    """
                    Failed to load the "\(name)" font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                    """
            )
        }
    
        return UIFontMetrics(forTextStyle: dynamic.style)
            .scaledFont(for: font)
    }
}

@available(iOS 13.0, *)
public extension NSMutableAttributedString {
    
    // e.g.
    //        stackLabel.textColor = .black
    //           stackLabel.attributedText = NSMutableAttributedString()
    //              .text("Noto", fontName: "NotoSansKR", type: .black, dynamic: .title1)
    //              .text("Sans", fontName: "NotoSansKR", type: .thin, dynamic: .body)
    
    // Make sure the font file is included in the project
    // and the font name is spelled correctly
    
    func text(
        _ string: String,
        fontName: String,
        type: FontFamily,
        dynamic: DynamicFont
    ) -> NSMutableAttributedString {
        let font = UIFont.withFontFamilyName(
            name: fontName,
            type: type,
            dynamic: dynamic
        )
        
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        self.append(NSAttributedString(
            string: string,
            attributes: attributes
        ))
        
        return self
    }
    
    
    // e.g.
    //        stackLabel.textColor = .black
    //           stackLabel.attributedText = NSMutableAttributedString()
    //              .colorText("K", fontName: "NotoSansKR", type: .bold, dynamic: .largeTitle, color: .systemBlue)
    //              .colorText("R", fontName: "NotoSansKR", type: .regular, dynamic: .largeTitle, color: .systemRed)
    
    // Make sure the font file is included in the project
    // and the font name is spelled correctly
    
    func colorText(
        _ string: String,
        fontName: String,
        type: FontFamily,
        dynamic: DynamicFont,
        color: UIColor
    ) -> NSMutableAttributedString {
        let font = UIFont.withFontFamilyName(
            name: fontName,
            type: type,
            dynamic: dynamic
        )
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        
        self.append(NSAttributedString(
            string: string,
            attributes: attributes
        ))
        
        return self
    }
}
