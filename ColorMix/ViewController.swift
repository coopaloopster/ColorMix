//
//  ViewController.swift
//  ColorMix
//
//  Created by admin on 4/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Instance Properties
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        
        updateUI()
        updateSliderControls()
        
        colorView.backgroundColor = .systemGray
    }
    
    // MARK: - IB Actions
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        updateUI()
        updateSliderControls()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateUI()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
    
    // MARK: - Instance Methods
    func updateUI() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        //assign color to our colorView
        
        colorView.backgroundColor = color
        
        
    }
    
    func reset() {
            redSwitch.isOn = false
            blueSwitch.isOn = false
            greenSwitch.isOn = false
        
            redSlider.value = 0.5
            blueSlider.value = 0.5
            greenSlider.value = 0.5
        
            updateUI()
            updateSliderControls()
            colorView.backgroundColor = .systemGray
    }
    
    func updateSliderControls() {
        redSlider.isEnabled = redSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
    }

}

