import UIKit

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
    class func checkFamilyFontName() {
        for f in familyNames {
            print("\(f)")
            for n in fontNames(forFamilyName: f) {
                print("==\(n)")
            }
        }
    }
    
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

public extension NSMutableAttributedString {
    
}
