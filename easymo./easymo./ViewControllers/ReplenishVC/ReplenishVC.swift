//
//  ReplenishVC.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class ReplenishVC: UIViewController {
    
    @IBOutlet weak var summField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var summImage: UIImageView!
    @IBOutlet weak var dateImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancellationButton: UIButton!
    
    
    private var piker = UIDatePicker()
    private var selectedDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        summField.delegate = self
        dateField.delegate = self
        
        dateField.inputView = piker
        piker.datePickerMode = .dateAndTime
        piker.locale = Locale(identifier: "ru_RU")
        piker.preferredDatePickerStyle = .wheels
        piker.addTarget(self, action: #selector(dateDidPiked), for: .allEvents)
        
        saveButton.layer.cornerRadius = 12
        cancellationButton.layer.cornerRadius = 12
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        textFieldMargen()
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        let saveReplenish = ReplenishMoney()
        saveReplenish.replenishMoney = summField.text ?? ""
        saveReplenish.replenishTime = selectedDate
        
        RealmManager.saveReplenishMoney(object: saveReplenish)
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    func textFieldMargen() {
        summImage.image = UIImage.init(named: "BYN")
        dateImage.image = UIImage.init(named: "ic-calendar")
        
        summField.layer.cornerRadius = 8
        dateField.layer.cornerRadius = 8
        
        
        summField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        summField.leftViewMode = .always
        
        dateField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: dateField.frame.height))
        dateField.leftViewMode = .always
    }
    
    @objc func dateDidPiked() {
        self.selectedDate = piker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateField.text = formatter.string(from: piker.date)
    }

}
extension ReplenishVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == summField {
            summField.layer.borderWidth = 2
            summField.backgroundColor = .none
            summField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
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
        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
