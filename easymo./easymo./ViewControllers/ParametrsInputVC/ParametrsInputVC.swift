//
//  ParametrsInputVC.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class ParametrsInputVC: UIViewController {
    
    @IBOutlet weak var viewFaceID: UIView!
    @IBOutlet weak var viewPIN: UIView!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Параметры входа"
        viewFaceID.layer.cornerRadius = 8
        viewPIN.layer.cornerRadius = 8
        
        let tap = UIGestureRecognizer(target: self, action: #selector(tapPIN))
        viewPIN.addGestureRecognizer(tap)
    }
    @objc func tapPIN() {
        let inputVC = InputVC(nibName: String(describing: InputVC.self), bundle: nil)
        navigationController?.pushViewController(inputVC, animated: true)
    }

    @IBAction func switchAction(_ sender: Any) {
        if switchOutlet.isOn {
            NotificationCenter.default.post(name: .faceID, object: nil)
            DefaultsManager.faceID = true
        } else {
            DefaultsManager.faceID = false
        }
    }
}

