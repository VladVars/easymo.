//
//  SpendPiggyVC.swift
//  easymo.
//
//  Created by mac on 3.07.22.
//

import UIKit

class SpendPiggyVC: UIViewController {
    
    @IBOutlet weak var imagePiggy: UIImageView!
    @IBOutlet weak var summField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var spendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summField.delegate = self
        
        imagePiggy.image = UIImage.init(named: "ass-pig")
        
        cancelButton.layer.cornerRadius = 12
        spendButton.layer.cornerRadius = 12
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        textFieldMargen()
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldMargen() {
        imageField.image = UIImage.init(named: "BYN")
        
        
        summField.layer.cornerRadius = 8
        
        summField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        summField.leftViewMode = .always
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)

    }
    
    
    @IBAction func spendAction(_ sender: Any) {
    }
    
    
}
extension SpendPiggyVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == summField {
            summField.layer.borderWidth = 2
            summField.backgroundColor = .none
            summField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
