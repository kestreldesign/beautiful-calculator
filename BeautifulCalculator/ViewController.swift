//
//  ViewController.swift
//  BeautifulCalculator
//
//  Created by The Deblings on 19/09/2015.
//  Copyright © 2015 Kestrel Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //outlets
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    //variables
    var currentInput = ""
    var leftInput = "0"
    var operatorPressed: Operator = .Empty
    var bgImageTimer: NSTimer!
    var nextImage = 2
    
    //enums
    enum Operator {
        case Add
        case Divide
        case Multiply
        case Subtract
        case Empty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextImage = Int(arc4random_uniform(2)+1)
        print("bg\(nextImage).png")
        backgroundImage.image = UIImage(named: "bg\(nextImage).png")
        bgImageTimer = NSTimer.scheduledTimerWithTimeInterval(9, target: self, selector: Selector("imageFadeIn"), userInfo: nil, repeats: true)
    }
    
    
    func imageFadeIn() {
        nextImage++
        if nextImage >= 4 {
            nextImage = 1
        }
        let name = "bg\(nextImage).png"
        print(name)
        let secondImageView = UIImageView(image: UIImage(named: "\(name)"))
        secondImageView.frame = view.frame
        secondImageView.alpha = 0.0
        
        view.insertSubview(secondImageView, aboveSubview: backgroundImage)
        
        UIView.animateWithDuration(4.0, delay: 0, options: .CurveEaseOut, animations: {
            secondImageView.alpha = 1.0
            }, completion: {_ in
                self.backgroundImage.image = secondImageView.image
                secondImageView.removeFromSuperview()
        })
    }

    @IBAction func numberButtonPressed(btn: UIButton) {
        if btn.tag == -1 {
            currentInput += "."
        } else {
            currentInput += "\(btn.tag)"
        }
        displayText.text = currentInput
    }
    
    @IBAction func addButtonWasPressed(sender: UIButton) {
        doCalculation()
        operatorPressed = .Add
        storeLeftInput()
    }
    @IBAction func divideButtonWasPressed(sender: UIButton){
        doCalculation()
        operatorPressed = .Divide
        storeLeftInput()
    }
    @IBAction func multiplyButtonWasPressed(sender: UIButton){
        doCalculation()
        operatorPressed = .Multiply
        storeLeftInput()
    }
    @IBAction func subtractButtonWasPressed(sender: UIButton){
        doCalculation()
        operatorPressed = .Subtract
        storeLeftInput()
    }
    @IBAction func clearButtonWasPressed(sender: UIButton){
        operatorPressed = .Empty
        currentInput = ""
        leftInput = "0"
        displayText.text = "0"
    }
    @IBAction func equalsButtonWasPressed(sender: AnyObject) {
        doCalculation()
        operatorPressed = .Empty
        storeLeftInput()
    }
    func doCalculation(){
        var theResult = ""
        if operatorPressed != Operator.Empty {
            if currentInput != "" {
            if operatorPressed == .Add {
                theResult = "\(Double(leftInput)! + Double(currentInput)!)"
            } else if operatorPressed == .Divide {
                theResult = "\(Double(leftInput)! / Double(currentInput)!)"
            } else if operatorPressed == .Multiply {
                theResult = "\(Double(leftInput)! * Double(currentInput)!)"
            } else if operatorPressed == .Subtract {
                theResult = "\(Double(leftInput)! - Double(currentInput)!)"
            }
            if Double(theResult)! % 1 == 0 {
                let substringRange = theResult.endIndex.advancedBy(-2)..<theResult.endIndex
                theResult.removeRange(substringRange)
            }
            displayText.text = theResult
            currentInput = theResult
            }
        }
    }
    
    func storeLeftInput(){
        if currentInput != ""{
            leftInput = currentInput
            currentInput = ""
        }
    }

}

