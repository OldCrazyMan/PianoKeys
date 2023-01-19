//
//  ViewModels.swift
//  PianoKeys
//
//  Created by Tim Akhmetov on 19.01.2023.
//

import UIKit

class WhiteButtonModel: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.setImage(Constants.Image.whiteButton, for: .normal)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class BlackButtonModel: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setImage(Constants.Image.blackButton, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
