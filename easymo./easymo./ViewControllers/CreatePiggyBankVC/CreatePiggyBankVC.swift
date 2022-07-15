//
//  CreatePiggyBankVC.swift
//  easymo.
//
//  Created by mac on 2.07.22.
//

import UIKit

class CreatePiggyBankVC: UIViewController {
    
    @IBOutlet weak var cinteinerView: UIView!
    
    @IBOutlet weak var goalField: UITextField!
    @IBOutlet weak var summField: UITextField!
    @IBOutlet weak var periodField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var summImage: UIImageView!
    @IBOutlet weak var periodImage: UIImageView!
    
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    private var imagePicker = UIImagePickerController()
    private var images = UIImage()
    
    private var switchCondition = "Нет"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summField.delegate = self
        periodField.delegate = self
        goalField.delegate = self
        
        textFieldMargen()
        setupUI()
    }
    
    func setupUI() {
        cancelButton.layer.cornerRadius = 12
        saveButton.layer.cornerRadius = 12
        
        cinteinerView.layer.cornerRadius = 16
        imageView.layer.cornerRadius = 16
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func textFieldMargen() {
        summImage.image = UIImage.init(named: "BYN")
        periodImage.image = UIImage.init(named: "ic-arrow")
//        dateImage.image = UIImage.init(named: "ic-calendar")

        summField.layer.cornerRadius = 8
        periodField.layer.cornerRadius = 8
        goalField.layer.cornerRadius = 8
    
        
        summField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: summField.frame.height))
        summField.leftViewMode = .always
        periodField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: periodField.frame.height))
        periodField.leftViewMode = .always
        goalField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: goalField.frame.height))
        goalField.leftViewMode = .always
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func swichAction(_ sender: Any) {
        if switchOutlet.isOn {
            switchCondition = "Да"
        } else {
            switchCondition = "Нет"
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        let alertController: UIAlertController = UIAlertController(title: nil, message: "Источник изображения:", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { UIAlertAction in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true)
        }
        
        let gallaryAction = UIAlertAction(title: "Галерея", style: .default) {
            UIAlertAction in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(gallaryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
        
        
    }
    @IBAction func saveAction(_ sender: Any) {
        let confirmationVC = ConfirmationVC(nibName: String(describing: ConfirmationVC.self), bundle: nil)
        present(confirmationVC, animated: true)
        confirmationVC.imageView.image = imageView.image
        confirmationVC.goalLabel.text = goalField.text
        confirmationVC.summLabel.text = summField.text
        confirmationVC.notificationLabel.text = switchCondition
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)

    }
    @IBAction func switchAction(_ sender: Any) {
        
    }
    

    
}
extension CreatePiggyBankVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        (rawValue: "UIImagePickerControllerOriginalImage")
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.images = image
            imageView.image = images
//            addButton.isHidden = true
        }
        picker.dismiss(animated: true)
    }
}

extension CreatePiggyBankVC: UITextFieldDelegate {
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
        if textField == goalField {
            goalField.layer.borderWidth = 2
            goalField.backgroundColor = .none
            goalField.layer.borderColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        periodImage.image = UIImage.init(named: "ic-arrow")

        textField.layer.borderWidth = 0
        textField.layer.borderColor = .none
        textField.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
    }
}
