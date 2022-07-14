//
//  RoundButton.swift
//  easymo.
//
//  Created by mac on 11.07.22.
//

import Foundation
import UIKit

class RoundButton: UIButton {
    
    override var isTouchInside: Bool {
        changeColor()
        return true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
        self.tintColor = .black

        
    }
    
    private func changeColor() {
        
        UIView.animate(withDuration: 0.3) {
            self.layer.backgroundColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 0.1456995846)
            self.tintColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)

        } completion: { isFinished in
            UIView.animate(withDuration: 0.1) {
                self.layer.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
                self.tintColor = .black
            }
        }

    }
    
}
