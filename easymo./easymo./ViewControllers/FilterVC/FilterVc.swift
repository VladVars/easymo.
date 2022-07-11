//
//  FilterVc.swift
//  easymo.
//
//  Created by mac on 4.07.22.
//

import UIKit

class FilterVc: UIViewController {

    @IBOutlet weak var categorieField: UITextField!
    @IBOutlet weak var startDateField: UITextField!
    @IBOutlet weak var finishDateField: UITextField!
    
    @IBOutlet weak var categorieImage: UIImageView!
    @IBOutlet weak var startDateImage: UIImageView!
    @IBOutlet weak var finishDateImage: UIImageView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    private var pikerStartDate = UIDatePicker()
    private var pikerFinishDate = UIDatePicker()
    private var selectedDate: Date?
    
    private var categories: [Categories] = Categories.allCases
    private var categoriesPicker = UIPickerView()
    private var selectedCategories: Categories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categorieField.delegate = self
        startDateField.delegate = self
        finishDateField.delegate = self
        
        categoriesPicker.dataSource = self
        categoriesPicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        textFieldMargen()
        
        setupPicker()
    }
    
    func setupPicker() {
        startDateField.inputView = pikerStartDate
        finishDateField.inputView = pikerFinishDate
        
        
        pikerStartDate.datePickerMode = .date
        pikerStartDate.locale = Locale(identifier: "ru_RU")
        pikerStartDate.preferredDatePickerStyle = .wheels
        pikerStartDate.addTarget(self, action: #selector(startDateDidPiked), for: .allEvents)
        
        
        pikerFinishDate.datePickerMode = .date
        pikerFinishDate.locale = Locale(identifier: "ru_RU")
        pikerFinishDate.preferredDatePickerStyle = .wheels
        pikerFinishDate.addTarget(self, action: #selector(finishDateDidPiked), for: .allEvents)
        
        
        categorieField.inputView = categoriesPicker
    }
    
    func textFieldMargen() {
        categorieImage.image = UIImage.init(named: "ic-arrow")
        startDateImage.image = UIImage.init(named: "ic-calendar")
        finishDateImage.image = UIImage.init(named: "ic-calendar")

        categorieField.layer.cornerRadius = 8
        startDateField.layer.cornerRadius = 8
        finishDateField.layer.cornerRadius = 8
        
        cancelButton.layer.cornerRadius = 12
        saveButton.layer.cornerRadius = 12
        
        categorieField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: categorieField.frame.height))
        categorieField.leftViewMode = .always
        startDateField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: startDateField.frame.height))
        startDateField.leftViewMode = .always
        finishDateField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: finishDateField.frame.height))
        finishDateField.leftViewMode = .always
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func startDateDidPiked() {
        self.selectedDate = pikerStartDate.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        startDateField.text = formatter.string(from: pikerStartDate.date)
    }
    
    @objc func finishDateDidPiked() {
        self.selectedDate = pikerFinishDate.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        finishDateField.text = formatter.string(from: pikerFinishDate.date)
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
    }
    
}

extension FilterVc: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == categorieField {
            categorieImage.image = UIImage(named: "ic-arrow-active")
            categorieField.layer.borderWidth = 2
            categorieField.backgroundColor = .none
            categorieField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
        if textField == startDateField {
            startDateImage.image = UIImage(named: "ic-calendar-active")
            startDateField.layer.borderWidth = 2
            startDateField.backgroundColor = .none
            startDateField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
        if textField == finishDateField {
            finishDateImage.image = UIImage(named: "ic-calendar-active")
            finishDateField.layer.borderWidth = 2
            finishDateField.backgroundColor = .none
            finishDateField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        categorieImage.image = UIImage.init(named: "ic-arrow")
        startDateImage.image = UIImage.init(named: "ic-calendar")
        finishDateImage.image = UIImage.init(named: "ic-calendar")

        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}

extension FilterVc: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    
}
extension FilterVc: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categorieField.text = categories[row].rawValue
        self.selectedCategories = categories[row]
    }
}
