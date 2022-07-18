//
//  StartMouthVC.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class StartMouthVC: UIViewController {
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Начало месяца"
        
        numberField.delegate = self
        
        numberField.layer.cornerRadius = 8
        saveButton.layer.cornerRadius = 12
        cancelButton.layer.cornerRadius = 12
        
        numberField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: numberField.frame.height))
        numberField.leftViewMode = .always

    }
    
    @IBAction func saveAction(_ sender: Any) {
    }
    

    @IBAction func cancelButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
extension StartMouthVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == numberField {
            numberField.layer.borderWidth = 2
            numberField.backgroundColor = .none
            numberField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
