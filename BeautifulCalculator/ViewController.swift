//
//  ViewController.swift
//  BeautifulCalculator
//
//  Created by The Deblings on 19/09/2015.
//  Copyright © 2015 Kestrel Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var displayText: UILabel!
    var leftInput = ""

    @IBAction func numberButtonPressed(btn: UIButton) {
        if btn.tag == -1 {
            leftInput += "."
        } else {
            leftInput += "\(btn.tag)"
        }
        displayText.text = leftInput
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

