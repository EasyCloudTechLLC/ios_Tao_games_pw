//
//  roundButton.swift
//  Calculator_simpla
//
//  Created by PW on 7/9/21.
//


import UIKit

@IBDesignable

class roundButton: UIButton {
    @IBInspectable var roundButton: Bool = false{
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height / 2
        }
    }

}

