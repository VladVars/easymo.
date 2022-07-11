//
//  RoundButton.swift
//  easymo.
//
//  Created by mac on 11.07.22.
//

import Foundation
import UIKit

class RoundButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.tintColor = .white
    }
    
   
}
