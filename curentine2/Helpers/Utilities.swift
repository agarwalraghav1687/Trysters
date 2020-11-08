//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        // Create the bottom line
        let bottomLine = CALayer()
        
        // Remove border on text field and add shadow
        textfield.borderStyle = .none
        textfield.backgroundColor = #colorLiteral(red: 0.8926708102, green: 1, blue: 0.8714503646, alpha: 1)
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        // Add corner radius and border
        textfield.layer.borderWidth = 1.5
        textfield.layer.cornerRadius = 20
        textfield.layer.masksToBounds = true
        textfield.layer.sublayerTransform = CATransform3DMakeTranslation(27, 0, 0)
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        button.backgroundColor = #colorLiteral(red: 0.8926708102, green: 1, blue: 0.8714503646, alpha: 1)
        // Add corner radius and border
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
