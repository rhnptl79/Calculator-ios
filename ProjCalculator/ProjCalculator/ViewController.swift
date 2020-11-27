//
//  ViewController.swift
//  ProjCalculator
//
//  Created by Rohan Patel on 14/11/20.
//  Copyright © 2020 Rohan Patel. All rights reserved.
//

import UIKit

enum Operation:String
{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Percentage = "%"
    case root = "r"
    case NULL = "NULL"
}


class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runnigNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var fll = true
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        outputLbl.text = "0"
    
    }

    @IBAction func numberPressed(_ sender: RoundButton)
    {
        if runnigNumber.count <= 8
        {
            runnigNumber += "\(sender.tag)"
            outputLbl.text = runnigNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton)
    {
        runnigNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        fll = true
        
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton)
    {
        if (fll == true)
        {
            if runnigNumber.count <= 7
            {
                runnigNumber += "."
                outputLbl.text = runnigNumber
            }
            fll = false
        }
        
    }
    
    @IBAction func equalPressed(_ sender: RoundButton)
    {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: RoundButton)
    {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton)
    {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton)
    {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton)
    {
        operation(operation: .Divide)
    }
    
    
    @IBAction func percentagePressed(_ sender: RoundButton)
    {
        operation(operation: .Percentage)
    }
    
    
    @IBAction func rootPreesed(_ sender: RoundButton)
    {
        operation(operation: .root)
    }
    
    
    
    
    
    func operation(operation: Operation)
    {
        if currentOperation != .NULL
        {
            if runnigNumber != ""
            {
                rightValue = runnigNumber
                runnigNumber = ""
                
                if currentOperation == .Add
                {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }
                else if currentOperation == .Subtract
                {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    
                }
                else if currentOperation == .Multiply
                {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    
                }
                else if currentOperation == .Divide
                {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                else if currentOperation == .Percentage
                {
                    result = "\((Double(leftValue)! * Double(rightValue)!) / 100)"
                }
                else if currentOperation == .root
                {
                    result = "\(sqrt(Double(leftValue)!))"
                }
                
                leftValue = result
                
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0)
                {
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            
            currentOperation = operation
            
        }
        else
        {
            leftValue = runnigNumber
            runnigNumber = ""
            currentOperation = operation
        }
    }
    
    
    
    
}

