//
//  ViewController.swift
//  Home work 2.2
//
//  Created by Юлия on 22.05.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

protocol BackgroundColorProtocol {
    func changeColor(_ red: UISlider, _ green: UISlider, _ blue: UISlider)
}
    
class BackgroundToolsViewController: UIViewController {
    
    @IBOutlet var redSliderLabel: UILabel!
    @IBOutlet var greenSliderLabel: UILabel!
    @IBOutlet var blueSliderLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var rgbView: UIView!
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: BackgroundColorProtocol!
    
    var rgbViewColor: UIColor!
    
    var red: Float!
    var green: Float!
    var blue: Float!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.backgroundColor = rgbViewColor
        rgbView.layer.cornerRadius = 10
        
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        
        setValue(senders: redSlider, greenSlider, blueSlider)
        setValueInTextField(senders: redSlider, greenSlider, blueSlider)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
       

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.changeColor(redSlider, greenSlider, blueSlider)
        dismiss(animated: true)
    }
    
    @IBAction func moveSlider(sender: UISlider) {
        switch sender.tag {
        case 0: do {
            redSliderLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
            }
        case 1: do {
            greenSliderLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
            }
        case 2: do {
            blueSliderLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
            }
            
        default: break
        }
        setColor()
    }
    
    private func setColor() {
        rgbView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 0.9
        )
    }
    
    private func setValue(senders: UISlider...) {
        for sender in senders {
            switch sender.tag {
            case 0: redSliderLabel.text = string(from: redSlider)
            case 1: greenSliderLabel.text = string(from: greenSlider)
            case 2: blueSliderLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setValueInTextField (senders: UISlider...) {
        for sender in senders {
            switch sender.tag {
            case 0: redTextField.text = string(from: redSlider)
            case 1: greenTextField.text = string(from: greenSlider)
            case 2: blueTextField.text = string(from: blueSlider)
            default: break
            }
        }
    }

    private func string (from sender: UISlider ) -> String {
        String(format: "%.2f", sender.value)
    }
}

extension BackgroundToolsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0: do {
            redSliderLabel.text = String(format: "%.2f", redTextField.text ?? "")
            redSlider.value = Float(redTextField.text!) ?? 0
            }
        case 1: do {
            greenSliderLabel.text = String(format: "%.2f", greenTextField.text ?? "")
            greenSlider.value = Float(greenTextField.text!) ?? 0
            }
        case 2: do {
            blueSliderLabel.text = String(format: "%.2f", greenTextField.text ?? "")
            blueSlider.value = Float(blueTextField.text!) ?? 0
            }
        default:
            break
        }
        setColor()
    }
}



  



