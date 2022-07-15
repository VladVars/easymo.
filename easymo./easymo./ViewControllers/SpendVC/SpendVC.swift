//
//  SpendVC.swift
//  easymo.
//
//  Created by mac on 20.06.22.
//

import UIKit

class SpendVC: UIViewController {
    
    @IBOutlet weak var summField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var categorieField: UITextField!
    
    @IBOutlet weak var summImage: UIImageView!
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var categorieImage: UIImageView!
    
    
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancellationButton: UIButton!
    
    
    private var piker = UIDatePicker()
    private var selectedDate: Date?
    
    weak var delegate: Updaeble?
    
    private var categories: [Categories] = Categories.allCases
    private var categoriesPicker = UIPickerView()
    private var selectedCategories: Categories?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summField.delegate = self
        dateField.delegate = self
        categorieField.delegate = self
        
        dateField.inputView = piker
        piker.datePickerMode = .dateAndTime
        piker.locale = Locale(identifier: "ru_RU")
        piker.preferredDatePickerStyle = .wheels
        piker.addTarget(self, action: #selector(dateDidPiked), for: .allEvents)
        
        categoriesPicker.dataSource = self
        categoriesPicker.delegate = self
        categorieField.inputView = categoriesPicker
        
        
        saveButton.layer.cornerRadius = 12
        cancellationButton.layer.cornerRadius = 12
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        textFieldMargen()
        
    }
    
    func textFieldMargen() {
        summImage.image = UIImage.init(named: "BYN")
        categorieImage.image = UIImage.init(named: "ic-arrow")
        dateImage.image = UIImage.init(named: "ic-calendar")
        
        summField.layer.cornerRadius = 8
        categorieField.layer.cornerRadius = 8
        dateField.layer.cornerRadius = 8
        
        
        summField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        summField.leftViewMode = .always
        categorieField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: categorieField.frame.height))
        categorieField.leftViewMode = .always
        dateField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: dateField.frame.height))
        dateField.leftViewMode = .always
    }
    
    @objc func dateDidPiked() {
        self.selectedDate = piker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateField.text = formatter.string(from: piker.date)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        let saveMoney = Money()
        saveMoney.spendMoney = summField.text ?? ""
        saveMoney.spendTime = selectedDate
        saveMoney.category = categorieField.text ?? ""
        RealmManager.save(object: saveMoney)
        
        summField.text = ""
        dateField.text = ""
        categorieField.text = ""
        
        dismissKeyboard()
        
        
    }
    
    @IBAction func cancellationButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}
extension SpendVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    
}
extension SpendVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categorieField.text = categories[row].rawValue
        self.selectedCategories = categories[row]
    }
}

extension SpendVC: UITextFieldDelegate {
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
        if textField == categorieField {
            categorieImage.image = UIImage(named: "ic-arrow-active")
            categorieField.layer.borderWidth = 2
            categorieField.backgroundColor = .none
            categorieField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        dateImage.image = UIImage.init(named: "ic-calendar")
        categorieImage.image = UIImage.init(named: "ic-arrow")
        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
