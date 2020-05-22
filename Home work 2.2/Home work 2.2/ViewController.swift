//
//  ViewController.swift
//  Home work 2.2
//
//  Created by Юлия on 22.05.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redSliderLabel: UILabel!
    @IBOutlet var greenSliderLabel: UILabel!
    @IBOutlet var blueSliderLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var rgbView: UIView!
    
    private func changeRGBViewBackgroundColor() {
        rgbView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 0.9
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSliderLabel.text = String(format: "%.2f", redSlider.value)
        greenSliderLabel.text = String(format: "%.2f", greenSlider.value)
        blueSliderLabel.text = String(format: "%.2f", blueSlider.value)
        
        rgbView.layer.cornerRadius = 10
        changeRGBViewBackgroundColor()
    }
    
    @IBAction func redSliderMove() {
        redSliderLabel.text = String(format: "%.2f", redSlider.value)
        changeRGBViewBackgroundColor()
    }
    
    @IBAction func greenSliderMove() {
        greenSliderLabel.text = String(format: "%.2f", greenSlider.value)
        changeRGBViewBackgroundColor()
    }
    
    @IBAction func blueSliderMove() {
        blueSliderLabel.text = String(format: "%.2f", blueSlider.value)
        changeRGBViewBackgroundColor()
    }
}

