//
//  CustomButton.swift
//  Norris 25
//
//  Created by Joshua Van Niekerk on 08/05/2020.
//  Copyright © 2020 Josh-Dog101. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(buttonType: Int = 1, title: String = "", largeScreen:Bool = false) {
        
        // buttonType 0 = No button
        // button type 1 = Yes button
        // button type 2 = Category button
        
        let textColor = UIColor(named: "TextColorLightAndDarkMode")
        var buttonX: Int = 0
        var buttonFrame:CGRect = CGRect()
        
        switch (buttonType) {
        case 0:
            setTitle("No", for: .normal)
            setTitleColor(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), for: .normal)
            tag     = 888 // this is random but just to set it apart from the questionaire button tags
            buttonX = Int((UIViewController().view.frame.width - 12) / 2) + 8
            
        case 1:
            setTitle("Yes", for: .normal)
            setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: .normal)
            tag     = 999 // this is random but just to set it apart from the questionaire button tags
            buttonX = 4
            
        default:
            setTitle(title, for: .normal)
            setTitleColor(textColor, for: .normal)
            buttonX = 4
        }
        
        buttonFrame         = positionButtonFrame(xCoordinate: buttonX)
        layer.cornerRadius  = 10
        layer.borderWidth   = 3.0
        layer.borderColor   = UIColor.darkGray.cgColor
        frame               = buttonFrame
        
        if (largeScreen) {
            titleLabel?.font    = UIFont(name: "Papyrus", size: 30)
        } else {
            titleLabel?.font    = UIFont(name: "Papyrus", size: 21)
        }
    }
    
    func positionButtonFrame(xCoordinate:Int = 4, yCoordinate: Int = 0, width: Int = 50) -> CGRect {
        
        let buttonFrame  = CGRect(x: xCoordinate, y: yCoordinate, width: width, height: 70)
        
        return buttonFrame
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue   = toValue
        
        layer.add(shake, forKey: nil)
    }
}
