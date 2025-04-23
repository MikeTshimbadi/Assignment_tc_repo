//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Mike Tshimbadi on 4/22/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput1: UITextField!
    
    @IBOutlet weak var textInput2: UITextField!
    
    @IBOutlet weak var resultText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func additionActionButton(_ sender: Any) {
        let num1 = Double(textInput1.text ?? "0.0") ?? 0.0
        let num2 = Double(textInput2.text ?? "0.0") ?? 0.0
        let result = num1 + num2
        resultText.text = String(result)
    }
    
    @IBAction func substractionActionButton(_ sender: Any) {
        guard let num1 = Double(textInput1.text ?? "0.0"),
              let num2 = Double(textInput2.text ?? "0.0") else {
            resultText.text = "Invalid Input"
            return
        }
        let result = num1 - num2
        resultText.text = String(result)
    }
    
    
    @IBAction func multiplicationActionButton(_ sender: Any) {
        guard let num1 = Double(textInput1.text ?? "0.0"),
              let num2 = Double(textInput2.text ?? "0.0") else {
            resultText.text = "Invalid Input"
            return
        }
        let result = num1 * num2
        resultText.text = String(result)
        
      
    }
    
    
    @IBAction func divisionActionButton(_ sender: Any) {
        guard let num1 = Double(textInput1.text ?? "0.0"),
              let num2 = Double(textInput2.text ?? "0.0") else {
            resultText.text = "Invalid Input"
            return
        }
        let result = num1 / num2
        resultText.text = String(result)
    }
    
}

