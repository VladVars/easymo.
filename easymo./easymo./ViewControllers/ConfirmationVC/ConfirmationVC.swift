//
//  ConfirmationVC.swift
//  easymo.
//
//  Created by mac on 3.07.22.
//

import UIKit

class ConfirmationVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var summLabel: UILabel!
    @IBOutlet weak var accumulationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    weak var delegat: Update?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.cornerRadius = 12
        saveButton.layer.cornerRadius = 12
        imageView.layer.cornerRadius = 16


    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)

    }
    @IBAction func saveAction(_ sender: Any) {
        let savePiggy = PiggyBank()
        guard let summ = Int(summLabel.text ?? "") else { return }
        
        savePiggy.summPiggyBank = summ
        savePiggy.namePiggyBank = goalLabel.text ?? ""
        
        RealmManager.savePiggyBank(object: savePiggy)
        
        delegat?.update()
        
        if savePiggy.summPiggyBank == summ, savePiggy.namePiggyBank == goalLabel.text {
            NotificationCenter.default.post(name: .createPiggy, object: nil)
            DefaultsManager.createPiggy = true
        }
        dismiss(animated: true)
        tabBarController?.selectedIndex = 0
        
    }
}
