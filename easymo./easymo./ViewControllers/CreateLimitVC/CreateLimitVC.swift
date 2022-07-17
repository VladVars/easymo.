//
//  CreateLimitVC.swift
//  easymo.
//
//  Created by mac on 30.06.22.
//

import UIKit

class CreateLimitVC: UIViewController {

    @IBOutlet weak var summField: UITextField!
    @IBOutlet weak var periodField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var suumImage: UIImageView!
    @IBOutlet weak var periodImage: UIImageView!
    @IBOutlet weak var dateImage: UIImageView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    private var piker = UIDatePicker()
    private var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summField.delegate = self
        periodField.delegate = self
        dateField.delegate = self
        
        dateField.inputView = piker
        piker.datePickerMode = .date
        piker.locale = Locale(identifier: "ru_RU")
        piker.preferredDatePickerStyle = .wheels
        piker.addTarget(self, action: #selector(dateDidPiked), for: .allEvents)
        
        cancelButton.layer.cornerRadius = 12
        saveButton.layer.cornerRadius = 12
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
       textFieldMargen()
    }
    
    func textFieldMargen() {
        suumImage.image = UIImage.init(named: "BYN")
        periodImage.image = UIImage.init(named: "ic-arrow")
        dateImage.image = UIImage.init(named: "ic-calendar")

        summField.layer.cornerRadius = 8
        periodField.layer.cornerRadius = 8
        dateField.layer.cornerRadius = 8
    
        
        summField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        summField.leftViewMode = .always
        periodField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: periodField.frame.height))
        periodField.leftViewMode = .always
        dateField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: dateField.frame.height))
        dateField.leftViewMode = .always
    }
    
    @objc func dateDidPiked() {
        self.selectedDate = piker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        dateField.text = formatter.string(from: piker.date)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let saveLimit = Limit()
        saveLimit.limit = summField.text ?? ""
        saveLimit.limitTime = selectedDate
        RealmManager.saveLimit(object: saveLimit)
        
        if saveLimit.limit == summField.text {
            NotificationCenter.default.post(name: .createLimit, object: nil)
            DefaultsManager.createLimit = true
        }
        
        summField.text = ""
        dateField.text = ""
        
        dismissKeyboard()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
extension CreateLimitVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == summField {
            summField.layer.borderWidth = 2
            summField.backgroundColor = .none
            summField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
        if textField == periodField {
            periodImage.image = UIImage(named: "ic-arrow-active")
            periodField.layer.borderWidth = 2
            periodField.backgroundColor = .none
            periodField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
        if textField == dateField {
            dateImage.image = UIImage(named: "ic-calendar-active")
            dateField.layer.borderWidth = 2
            dateField.backgroundColor = .none
            dateField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        dateImage.image = UIImage.init(named: "ic-calendar")
        periodImage.image = UIImage.init(named: "ic-arrow")

        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
