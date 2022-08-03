//
//  ViewController.swift
//  SetColorSlider
//
//  Created by Владимир Макаров on 30.11.2021.
//

import UIKit

protocol SetColorDelegate {
    func setColorDelegate(_ color: UIColor)
}

class MainViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SetColorViewController
        settingsVC.colorViewWindow = view.backgroundColor
        settingsVC.delegate = self
        
    }
}

extension MainViewController: SetColorDelegate {
    func setColorDelegate(_ color: UIColor) {
        view.backgroundColor = color
    }
}


