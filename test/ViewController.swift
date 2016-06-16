//
//  ViewController.swift
//  test
//
//  Created by Anurag Agnihotri on 6/16/16.
//  Copyright © 2016 Anurag Agnihotri. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var determineRGButton: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func determineRGStatus() {
        if isValidInput() {
            
            if isRGNumber(Int(inputTextField.text!)!) {
                outputLabel.text = "The Number is a valid RG Number"
            } else {
                outputLabel.text = "The Number is not a valid RG Number"
            }
        
        } else {

            showWrongInputError()
        
        }
    
    }
    
    /**
     Method to check if Input is a Valid Number.
     
     - returns: <#return value description#>
     */
    func isValidInput() -> Bool{
        if let text = inputTextField.text where !text.isEmpty {
            if let _ = Int(text) {
                return true
            }
        }
        return false
    }
    
    /**
     Method to display that User has not inputted a valid number.
     */
    func showWrongInputError() {
        outputLabel.text = "Please Enter A Valid Number"
    }
    
    /**
     Checking Maximum Divisiblity of the divident with the divisor.
     
     - parameter divident: <#divident description#>
     - parameter divisor:  <#divisor description#>
     
     - returns: <#return value description#>
     */
    func maxDivide(var divident: Int, divisor: Int) -> Int {
        
        while divident % divisor == 0 {
            divident = divident/divisor
            
        }
        
        return divident
    }

    
    /**
     Checks if the number is RG Number i.e. only has Prime factors 2,3 & 5.
     
     - parameter inputNumber: <#inputNumber description#>
     
     - returns: <#return value description#>
     */
    func isRGNumber(var inputNumber: Int) -> Bool {
        
        inputNumber = maxDivide(inputNumber, divisor: 2)
        inputNumber = maxDivide(inputNumber, divisor: 3)
        inputNumber = maxDivide(inputNumber, divisor: 5)
        
        return inputNumber == 1 ? true : false
    }
}

