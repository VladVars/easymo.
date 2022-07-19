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
    @IBOutlet weak var dateField: UITextField!
    
    
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var imageDateField: UIImageView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var spendButton: UIButton!
    
    private var piker = UIDatePicker()
    private var selectedDate: Date?
    
    weak var delegate: Update?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summField.delegate = self
        dateField.delegate = self
        
        dateField.inputView = piker
        piker.datePickerMode = .dateAndTime
        piker.locale = Locale(identifier: "ru_RU")
        piker.preferredDatePickerStyle = .wheels
        piker.addTarget(self, action: #selector(dateDidPiked), for: .allEvents)
        
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
        imageDateField.image = UIImage.init(named: "ic-calendar")
        
        summField.layer.cornerRadius = 8
        dateField.layer.cornerRadius = 8
        
        summField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        summField.leftViewMode = .always
        dateField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        dateField.leftViewMode = .always
        
    }
    
    @objc func dateDidPiked() {
        self.selectedDate = piker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateField.text = formatter.string(from: piker.date)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        delegate?.update()
        dismiss(animated: true)
        
    }
    
    
    @IBAction func spendAction(_ sender: Any) {
        let sependPiggy = PiggyBank()
        guard let summ = Int(summField.text ?? "") else { return }
        sependPiggy.spendPiggyBank = summ
        sependPiggy.piggyTime = selectedDate
        RealmManager.savePiggyBank(object: sependPiggy)
        
        summField.text = ""
        dateField.text = ""
        
        delegate?.update()
        dismiss(animated: true)
    }
    
    
}
extension SpendPiggyVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == summField {
            summField.layer.borderWidth = 2
            summField.backgroundColor = .none
            summField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
        
        if textField == dateField {
            imageDateField.image = UIImage(named: "ic-calendar-active")
            dateField.layer.borderWidth = 2
            dateField.backgroundColor = .none
            dateField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        imageDateField.image = UIImage.init(named: "ic-calendar")
        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
