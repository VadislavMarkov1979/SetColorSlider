//
//  SetColorViewController.swift
//  SetColorSlider
//
//  Created by Владимир Макаров on 30.11.2021.
//

import UIKit

class SetColorViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redLabelSlider: UILabel!
    @IBOutlet weak var greenLabelSlider: UILabel!
    @IBOutlet weak var blueLabelSlider: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    private var setingLabels: [UILabel] = []
    private var setingTF: [UITextField] = []
    
    var colorViewWindow: UIColor!
    var delegate: SetColorDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = colorViewWindow
        
        setSliders()
        setColorView()
    }
    
    
    @IBAction func setActionColorView() {
        setColorView()
    }
    
    private func setColorView() {
            colorView.backgroundColor = UIColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1)
        
        settingValueLabel ()
        settingTF ()
        
        }
    private func settingValueLabel () {
        setingLabels = [redLabelSlider, greenLabelSlider, blueLabelSlider]
        for labels in setingLabels {
            switch labels {
            case redLabelSlider:
                labels.text = String(format: "%.2f", redSlider.value)
            case greenLabelSlider:
                labels.text = String(format: "%.2f", greenSlider.value)
            default:
                labels.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    
    private func settingTF () {
        setingTF = [redTextField, greenTextField, blueTextField]
        for labels in setingTF {
            switch labels {
            case redTextField:
                labels.text = String(format: "%.2f", redSlider.value)
            case greenTextField:
                labels.text = String(format: "%.2f", greenSlider.value)
            default:
                labels.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: colorViewWindow)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    @IBAction func doneAction() {
        delegate.setColorDelegate(colorView.backgroundColor ?? .cyan)
        dismiss(animated: true)
    }
    
    
}
