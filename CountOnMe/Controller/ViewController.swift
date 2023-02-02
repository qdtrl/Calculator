//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    let calculator = Calculator()

    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        textView.text = calculator.addNumber(sender.title(for: .normal))
    }
    
    @IBAction func tappedSymbolButton(_ sender: UIButton) {
        switch sender.tag {
            case 10
            calculator.
            case 11
            case 12
            case 13
            
        }
    }
}

