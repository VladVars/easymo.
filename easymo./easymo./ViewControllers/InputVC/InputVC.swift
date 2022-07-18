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
    
    var passwordText = "" {
        didSet {
            updateStack(by: passwordText)
            
        }
    }
    var hasText: Bool {
        return passwordText.count > 0
    }
    
    var maxLength = 4
    let passCode = UIView()
    
    let stack = UIStackView()
    
    var controllerType: PasswordState = .enter
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "password") != nil {
            controllerType = .enter
        } else {
            controllerType = .create
        }
        infoLabel.text = controllerType.rawValue
        if DefaultsManager.faceID == true {
            faceID()
        }
        setupPin()
    }
    
    private func setupPin() {
        view.addSubview(passCode)
        passCode.frame = CGRect(x: 139, y: 300, width: 112, height: 16)
        passCode.addSubview(stack)
        passCode.backgroundColor = .white
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: passCode.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: passCode.trailingAnchor),
            stack.topAnchor.constraint(equalTo: passCode.topAnchor),
            stack.bottomAnchor.constraint(equalTo: passCode.bottomAnchor)
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        updateStack(by: passwordText)
    }
    
    private func emptyPin() -> UIView {
        let pin = Pin()
        pin.pin.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9568627451, alpha: 1)
        return pin
    }
    
    private func pin() -> UIView {
        let pin = Pin()
        pin.pin.backgroundColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        return pin
    }
    
    private func updateStack(by code: String) {
        var emptyPins:[UIView] = Array(0..<maxLength).map{_ in emptyPin()}
        let userPinLength = code.count
        let pins:[UIView] = Array(0..<userPinLength).map{_ in pin()}
        
        for (index, element) in pins.enumerated() {
            emptyPins[index] = element
        }
        stack.remove()
        for view in emptyPins {
            stack.addArrangedSubview(view)
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
                    NotificationCenter.default.post(name: .loginSuccess, object: nil)
                    DefaultsManager.loginPassword = true
                    print("Новый пароль сохранён")
                } else {
                    passCode.shake()
                    passwordText = ""
                    UserDefaults.standard.set(nil, forKey: "password")
                }
            }
        case .enter:
            if passwordText.count == 4 {
                if let savedPassword = UserDefaults.standard.string(forKey: "password"), savedPassword == passwordText {
                    NotificationCenter.default.post(name: .loginSuccess, object: nil)
                    DefaultsManager.loginPassword = true
                    print("Доступ разрешен")
                } else {
                    passCode.shake()
                    passwordText = ""
                }
            }
        }
        
    }
    
    
    @IBAction func deletAction(_ sender: Any) {
        passwordText.removeLast()
    }
    
    func faceID() {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed.") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        
                            NotificationCenter.default.post(name: .loginSuccess, object: nil)
                            DefaultsManager.loginPassword = true
                            self.dismiss(animated: true, completion: nil)
                       
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

extension UIStackView {
    
    func remove() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
    
}

public extension UIView {
    
    func shake(count : Float = 3, duration : TimeInterval = 0.2, translation : Float = 5) {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
