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
        update()
        setupPiggyView()
    }
    
    func progressBarPiggy() {
        guard let totPiggySumm = Int(totalSummLabel.text ?? "") else { return }
        guard let curPiggySumm = Int(currentSummLabel.text ?? "") else { return }
        
        let piggyPercent = Float(curPiggySumm * 100 / totPiggySumm) / 100
        piggyProgress.setProgress(piggyPercent, animated: true)
        
        if curPiggySumm >= totPiggySumm {
           
            let alert = UIAlertController(title: "Поздравляем!", message: "Вы накопили на \(RealmManager.readPiggyBank()[0].namePiggyBank)", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ок", style: .cancel)
            
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
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

extension PiggyBankVC: Update {
    func update() {
        if RealmManager.readPiggyBank().count > 0 {
            var summPiggy = 0
            
            for item in RealmManager.readPiggyBank() {
                if item.spendPiggyBank >= 0 {
                    summPiggy += item.spendPiggyBank
                }
            }
            namePiggyLabel.text = "\(RealmManager.readPiggyBank()[0].namePiggyBank)"
            currentSummLabel.text = "\(summPiggy)"
            totalSummLabel.text = "\(RealmManager.readPiggyBank()[0].summPiggyBank)"
        }
        progressBarPiggy()
    }
}
