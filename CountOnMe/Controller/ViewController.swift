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
        case 0:
            textView.text = calculator.addSymbol()
        case 1:
            textView.text = calculator.subSymbol()
        case 2:
            textView.text = calculator.mulSymbol()
        case 3:
            textView.text = calculator.divSymbol()
        case 4:
            textView.text = calculator.resetSymbol()
        case 5:
            textView.text = calculator.equalSymbol()
        default:
            textView.text = ""
        }
    }
}
