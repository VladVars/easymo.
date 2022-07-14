//
//  DashBoard.swift
//  easymo.
//
//  Created by mac on 15.06.22.
//

import UIKit
import PieCharts

class DashBoard: UIViewController {

    @IBOutlet weak var nameProgectView: UIView!
    @IBOutlet weak var limitsView: UIView!
    @IBOutlet weak var statisticView: UIView!
    @IBOutlet weak var pigguView: UIView!
    
    @IBOutlet weak var settingImage: UIImageView!
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var statisticUPImage: UIImageView!
    @IBOutlet weak var statisticDownImage: UIImageView!
    
    @IBOutlet weak var nameProgectLabel: UILabel!
    
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    @IBOutlet weak var upIncomeLabel: UILabel!
    @IBOutlet weak var downIcnomeLabel: UILabel!
    
    @IBOutlet weak var statisticLabel: UILabel!
    
    @IBOutlet weak var topUpButton: UIButton!
    @IBOutlet weak var spendButton: UIButton!
    @IBOutlet weak var piggyStartOutlet: UIButton!
    
    @IBOutlet weak var chartView: PieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIIcon()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if RealmManager.read().count > 0 {
                    downIcnomeLabel.text = "\(RealmManager.read()[0].spendMoney)"
                }
    }
    
    @objc func notificationImageDidTap() {
        let notificationVC = NotificationVC(nibName: String(describing: NotificationVC.self), bundle: nil)
        present(notificationVC, animated: true)
    }
    @objc func settingImageDidTap() {
        let settingVC = SettingDashBoardVC(nibName: String(describing: SettingDashBoardVC.self), bundle: nil)
        present(settingVC, animated: true)
    }
    private func setUIIcon() {
        statisticUPImage.image = UIImage.init(named: "upIncome")
        statisticDownImage.image = UIImage.init(named: "downIncome")
        settingImage.image = UIImage.init(named: "SettingIcon")
        notificationImage.image = UIImage.init(named: "Notifications")
        
    }
    
    @IBAction func topUpButtonAction(_ sender: Any) {
    }
    
    @IBAction func spendButtonAction(_ sender: Any) {
        
        let spendVC = SpendVC(nibName: String(describing: SpendVC.self), bundle: nil)
        spendVC.delegate = self
        present(spendVC, animated: true)
    }
    
    @IBAction func createLimit(_ sender: Any) {
        let limit = CreateLimitVC(nibName: String(describing: CreateLimitVC.self), bundle: nil)
        present(limit, animated: true)
    }
    
    
    @IBAction func piggyStartButton(_ sender: Any) {
        
        let createPiggyBank = CreatePiggyBankVC(nibName: String(describing: CreatePiggyBankVC.self), bundle: nil)
        present(createPiggyBank, animated: true)
    }
    
    func setupUI() {
        limitsView.layer.cornerRadius = 16
        statisticView.layer.cornerRadius = 16
        pigguView.layer.cornerRadius = 16
        
        topUpButton.layer.cornerRadius = 12
        spendButton.layer.cornerRadius = 12
        piggyStartOutlet.layer.cornerRadius = 12
        

        
        let notificationImageTap = UITapGestureRecognizer(target: self, action: #selector(notificationImageDidTap))
        notificationImage.addGestureRecognizer(notificationImageTap)
        notificationImage.isUserInteractionEnabled = true
        
        let settingImageTap = UITapGestureRecognizer(target: self, action: #selector(settingImageDidTap))
        settingImage.addGestureRecognizer(settingImageTap)
        settingImage.isUserInteractionEnabled = true
        
        
//        currentBalance.textColor = #colorLiteral(red: 0.5894673467, green: 0.6044110656, blue: 0.638481915, alpha: 1)
        currentBalance.textColor = UIColor(cgColor: CGColor(red: 0.59, green: 0.6, blue: 0.64, alpha: 1.0))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.43
        nameProgectLabel.attributedText = NSMutableAttributedString(string: "easymo.", attributes: [NSAttributedString.Key.kern: 0.37, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
}
//tabBarController?.selectedIndex = 2
extension DashBoard: Updaeble {
    func updataText(text: String) {
        
    }
    
    func changeTitleView(title: String) {
        
    }
    
    
    func updateViewColor(color: UIColor) {
        
    }
    
    
}
