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
    var switchCondition = false
    
    
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
        if let image = imageView.image {
        savePiggy.imagePiggyBank = image.jpegData(compressionQuality: 1) ?? Data()
        }
        savePiggy.summPiggyBank = summ
        savePiggy.namePiggyBank = goalLabel.text ?? ""
        
        RealmManager.savePiggyBank(object: savePiggy)
        
        
        if switchCondition {
            NotificationManager.setNotification(day: DefaultsManager.fundsDay)
        }
        
        if savePiggy.summPiggyBank == summ, savePiggy.namePiggyBank == goalLabel.text {
            NotificationCenter.default.post(name: .createPiggy, object: nil)
            DefaultsManager.createPiggy = true
        }
        delegat?.update()

        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        
    }
}

