//  calcDemoLesson2
//  Created by Nekokoatl on 19/09/16.
import Foundation
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var expressionLabel: UILabel!
    
    var userIsTyping: Bool  = false

    
//    @IBAction func resultButton(_ sender: UIButton) {
//        setDefaultExpression(value: "0")
//    }
//    
    @IBAction func one1(_ sender: UIButton) {
    }
    @IBAction func zero0(_ sender: UIButton) {
    }
    @IBAction func two2(_ sender: UIButton) {
    }
    @IBAction func three3(_ sender: UIButton) {
    }
    @IBAction func four4(_ sender: UIButton) {
    }
    @IBAction func five5(_ sender: UIButton) {
    }
    @IBAction func six6(_ sender: UIButton) {
    }
    @IBAction func seven7(_ sender: UIButton) {
    }
    @IBAction func eight8(_ sender: UIButton) {
    }
    @IBAction func nine9(_ sender: UIButton) {
    }
    @IBAction func copyButton(_ sender: UIButton) {
    }
    @IBAction func plusButton(_ sender: UIButton) {
    }
    @IBAction func minusButton(_ sender: UIButton) {
    }
    @IBAction func multiplyButton(_ sender: UIButton) {
    }
    @IBAction func divideButton(_ sender: UIButton) {
    }
    @IBAction func dotButton(_ sender: UIButton) {
    }
    @IBAction func eraseButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        //запускается раньше всего
        super.viewDidLoad()
        
  //      setDefaultExpression(value: "Error ")
        
        //анимация
        UIView.animate(withDuration: 12, delay: 0.0, options:[UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
            self.view.backgroundColor = self.bgColour1
            self.view.backgroundColor = self.bgColour2
            self.view.backgroundColor = self.bgColour3
            self.view.backgroundColor = self.bgColour2
            self.view.backgroundColor = self.bgColour1
            }, completion: nil)
        
    }
    

    @IBAction func addNumber (_ sender: UIButton) {
        let numberOnButton = sender.currentTitle!
        if userIsTyping {
            expressionLabel.text = expressionLabel.text! + numberOnButton
        }
        else {
            expressionLabel.text = numberOnButton
            userIsTyping = true
        }
    }
    
    
    let bgColour1 = UIColor(red:0.39, green:0.46, blue:0.47, alpha:1.00)
    let bgColour2 =  UIColor(red:0.62, green:0.74, blue:0.75, alpha:1.00)
    let bgColour3 = UIColor(red:0.84, green:0.98, blue:1.00, alpha:1.00)
    let lightColour = UIColor(red:0.35, green:0.85, blue:0.90, alpha:1.00)
    let darkColour = UIColor(red:0.18, green:0.22, blue:0.22, alpha:1.00)
    
    var calculatorMemory = Array<Int>()

    @IBAction func actionButtons() {
        userIsTyping = false
        calculatorMemory.append(displayValue)
    }
    
    var displayValue: Int {
        get {
            return NumberFormatter().number(from: expressionLabel.text!)!.intValue
        }
        
        set {
            expressionLabel.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        
        switch operation {
        case "✖︎" : countIt { $0 * $1 }
        case "⁒" : countIt { $0 / $1 }
        case "⎯" : countIt { $0 - $1 }
        case "+" : countIt { $0 + $1 }
  //      case "copy" : countIt { $0 + $1 }

        default: break
        }
    }
    
    func countIt(_ operation: (Int, Int) -> Int) {
        if calculatorMemory.count >= 2 {
            displayValue = operation(calculatorMemory.removeLast(),calculatorMemory.removeLast())
            actionButtons()
        }
    }

//    func setDefaultExpression(value: String){
//        expressionLabel.text = value
//    }
    
}
