//
//  UILabel+.swift
//  Converter
//
//  Created by Borys Klykavka on 14.06.2023.
//

import UIKit

extension UILabel {
    
    public func setUILabel (text: String) {
        self.text = text
        self.textColor = Colors.colorWhite
        self.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        self.layer.masksToBounds = true
        self.font = Fonts.fontKnewave40
        self.textAlignment = .center
        self.numberOfLines = 0
        self.backgroundColor = .clear
    }
    
}
