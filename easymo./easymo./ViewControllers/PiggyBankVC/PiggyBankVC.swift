//
//  PiggyBankVC.swift
//  easymo.
//
//  Created by mac on 16.06.22.
//

import UIKit

class PiggyBankVC: UIViewController {

    @IBOutlet weak var addImage: UIImageView!
    
    @IBOutlet weak var piggyImage: UIImageView!
    
    
    @IBOutlet weak var conteinerView: UIView!
    @IBOutlet weak var piggyView: UIView!
    
    
    @IBOutlet weak var toUpPiggyButton: UIButton!
    @IBOutlet weak var createPiggyBank: UIButton!
    
    @IBOutlet weak var currentSummLabel: UILabel!
    @IBOutlet weak var totalSummLabel: UILabel!
    @IBOutlet weak var namePiggyLabel: UILabel!
    
    @IBOutlet weak var piggyProgress: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupPiggyView()
    }
    
    func setupUI() {
        conteinerView.layer.cornerRadius = 16
        piggyView.layer.cornerRadius = 16
        
        toUpPiggyButton.layer.cornerRadius = 12
        createPiggyBank.layer.cornerRadius = 12
        
        addImage.image = UIImage.init(named: "ic-add")
        piggyImage.image = UIImage.init(named: "ass-pig")

        let tapAdd = UITapGestureRecognizer(target: self, action: #selector(addPiggy))
        addImage.addGestureRecognizer(tapAdd)
        addImage.isUserInteractionEnabled = true
    }
    @objc func addPiggy() {
        let createPiggyBank = CreatePiggyBankVC(nibName: String(describing: CreatePiggyBankVC.self), bundle: nil)
        present(createPiggyBank, animated: true)
    }
    
    func setupPiggyView() {
        
        if DefaultsManager.createPiggy {
            addPiggyView()
        } else {
            piggyView.isHidden = true

        }
    }
    
    @IBAction func createPiggyBankAction(_ sender: Any) {
        let createPiggyBank = CreatePiggyBankVC(nibName: String(describing: CreatePiggyBankVC.self), bundle: nil)
        present(createPiggyBank, animated: true)
    }
    
    @IBAction func topUpPiggyAction(_ sender: Any) {
        let spendPiggyVC = SpendPiggyVC(nibName: String(describing: SpendPiggyVC.self), bundle: nil)
        present(spendPiggyVC, animated: true)
    }
    private func notification() {
       
        NotificationCenter.default.addObserver(self, selector: #selector(addPiggyView), name: .createPiggy, object: nil)
        
    }
    
    @objc func addPiggyView() {
        piggyView.isHidden = false
    }
    
}
