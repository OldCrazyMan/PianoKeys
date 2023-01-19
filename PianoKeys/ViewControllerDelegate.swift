//
//  ViewControllerDelegate.swift
//  PianoKeys
//
//  Created by Tim Akhmetov on 19.01.2023.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didButtonPresed(vc: MainViewController, buttonName: String)
    func didButtonReleased(vc: MainViewController, buttonName: String)
}

class LoggingViewControllerDelegate: ViewControllerDelegate {
    
    func didButtonReleased(vc: MainViewController, buttonName: String) {
        print("Button released: " + "\(buttonName)")
    }
    
    func didButtonPresed(vc: MainViewController, buttonName: String) {
        print("Button pressed: " + "\(buttonName)")
    }
}
