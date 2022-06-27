//
//  ViewController.swift
//  StackyText
//
//  Created by yim2627 on 06/27/2022.
//  Copyright (c) 2022 yim2627. All rights reserved.
//

import UIKit
import StackyText

class ViewController: UIViewController {
    @IBOutlet weak var blackLabel: UILabel!
    @IBOutlet weak var boldLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var regularLabel: UILabel!
    @IBOutlet weak var thinLabel: UILabel!
    @IBOutlet weak var stackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIFont.checkFamilyFontName()
        
        blackLabel.text = "NotoSans_Black"
        blackLabel.textColor = .black
        blackLabel.font = .withFontFamilyName(name: "NotoSansKR", type: .black, dynamic: .title1)
        
        boldLabel.text = "NotoSans_Bold"
        boldLabel.textColor = .black
        boldLabel.font = .withFontFamilyName(name: "NotoSansKR", type: .bold, dynamic: .title1)
        
        lightLabel.text = "NotoSans_Light"
        lightLabel.textColor = .black
        lightLabel.font = .withFontFamilyName(name: "NotoSansKR", type: .light, dynamic: .title1)
        
        mediumLabel.text = "NotoSans_Medium"
        mediumLabel.textColor = .black
        mediumLabel.font = .withFontFamilyName(name: "NotoSansKR", type: .bold, dynamic: .title1)
        
        regularLabel.text = "NotoSans_Regular"
        regularLabel.textColor = .black
        regularLabel.font = .withFontFamilyName(name: "NotoSansKR", type: .regular, dynamic: .title1)
        
        thinLabel.text = "NotoSans_Thin"
        thinLabel.textColor = .black
        thinLabel.font = .withFontFamilyName(name: "NotoSansKR", type: .thin, dynamic: .title1)
        
        stackLabel.textColor = .black
        stackLabel.attributedText = NSMutableAttributedString()
            .text("Noto", fontName: "NotoSansKR", type: .black, dynamic: .title1)
            .text("Sans", fontName: "NotoSansKR", type: .thin, dynamic: .body)
            .colorText("K", fontName: "NotoSansKR", type: .bold, dynamic: .largeTitle, color: .systemBlue)
            .colorText("R", fontName: "NotoSansKR", type: .regular, dynamic: .largeTitle, color: .systemRed)
    }
}

