//
//  PiggyBankVC.swift
//  easymo.
//
//  Created by mac on 16.06.22.
//

import UIKit

class PiggyBankVC: UIViewController {

    @IBOutlet weak var addImage: UIImageView!
    
    @IBOutlet weak var conteinerView: UIView!
    @IBOutlet weak var createPiggyBank: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        conteinerView.layer.cornerRadius = 16
        createPiggyBank.layer.cornerRadius = 12
        addImage.image = UIImage.init(named: "ic-add")
    }

    @IBAction func createPiggyBankAction(_ sender: Any) {
        let createPiggyBank = CreatePiggyBankVC(nibName: String(describing: CreatePiggyBankVC.self), bundle: nil)
        present(createPiggyBank, animated: true)
    }
    
}
