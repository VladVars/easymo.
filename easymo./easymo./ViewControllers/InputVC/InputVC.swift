//
//  InputVC.swift
//  easymo.
//
//  Created by mac on 7.07.22.
//

import UIKit
import LocalAuthentication

class InputVC: UIViewController {

    @IBOutlet weak var biometricButton: RoundButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    let context = LAContext()

    
    var passwordText = ""
    
    var controllerType: PasswordState = .enter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "password") != nil {
            controllerType = .enter
        } else {
            controllerType = .create
        }
        infoLabel.text = controllerType.rawValue
        
        var error: NSError?
         if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
             biometricButton.alpha = 0
         } else {
             biometricButton.alpha = 1
         }
        
    }
    
    @IBAction func tapAction(_ sender: UIButton) {
        passwordText += "\(sender.tag)"
        switch controllerType {
        case .create:
            if passwordText.count == 4 {
                controllerType = .repeatPassword
                infoLabel.text = controllerType.rawValue
                UserDefaults.standard.set(passwordText, forKey: "password")
                passwordText = ""
            }
        case .repeatPassword:
            if passwordText.count == 4 {
                if let savedPassword = UserDefaults.standard.string(forKey: "password"), savedPassword == passwordText {
                    print("Новый пароль сохранён")
                } else {
                    UserDefaults.standard.set(nil, forKey: "password")
                }
            }
        case .enter:
            if passwordText.count == 4 {
                if let savedPassword = UserDefaults.standard.string(forKey: "password"), savedPassword == passwordText {
                    print("Доступ разрешен")
                }
            }
        }
    }
    
    @IBAction func faceIDAction(_ sender: Any) {
        if controllerType != .enter {
            print("Пороль не создан, иди гуляй")
        }
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Потому что мне нужно") { success, error in
            if error != nil {
                print(error?.localizedDescription)
            } else if success {
                print("Доступ разрешён")
            }
        }
        
    }
    
}
