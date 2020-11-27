//
//  RoundButton.swift
//  ProjCalculator
//
//  Created by Rohan Patel on 14/11/20.
//  Copyright © 2020 Rohan Patel. All rights reserved.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var roundButton: Bool = false
    {
            didSet
            {
                    if roundButton
                    {
                            layer.cornerRadius = frame.height / 2
                    }
            }
    }
    
    override func prepareForInterfaceBuilder()
    {
        if roundButton
        {
            layer.cornerRadius = frame.height / 2
        }
    }
}
	
