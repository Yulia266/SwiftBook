//
//  MainScreenViewController.swift
//  Home work 2.2
//
//  Created by Юлия on 06.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    
    var redView: CGFloat = 1.0
    var greenView: CGFloat = 1.0
    var blueView: CGFloat = 1.0
    var alphaView: CGFloat = 0.9
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newColorVC = segue.destination as! BackgroundToolsViewController
        newColorVC.delegate = self
        newColorVC.rgbViewColor = view.backgroundColor
        newColorVC.red = Float(redView)
        newColorVC.blue = Float(blueView)
        newColorVC.green = Float(greenView)
    }
}

extension MainScreenViewController: BackgroundColorProtocol {
    
    func changeColor(_ red: UISlider, _ green: UISlider, _ blue: UISlider) {
        view.backgroundColor = UIColor(
            red: CGFloat(red.value),
            green: CGFloat(green.value),
            blue: CGFloat(blue.value),
            alpha: 0.9
        )
        view.backgroundColor?.getRed(&redView, green: &greenView,
                                     blue: &blueView, alpha: &alphaView)
    }
}
