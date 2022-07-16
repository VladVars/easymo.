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
    @IBOutlet weak var curentLimitView: UIView!
    @IBOutlet weak var statisticView: UIView!
    @IBOutlet weak var createPiggyView: UIView!
    @IBOutlet weak var piggyView: UIView!
    
    @IBOutlet weak var settingImage: UIImageView!
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var limitImage: UIImageView!
    @IBOutlet weak var statisticUPImage: UIImageView!
    @IBOutlet weak var statisticDownImage: UIImageView!
    @IBOutlet weak var piggyImage: UIImageView!
    
    
    @IBOutlet weak var namePiggy: UILabel!
    @IBOutlet weak var nameProgectLabel: UILabel!
    
    @IBOutlet weak var curentSummLimitLabel: UILabel!
    @IBOutlet weak var totalSummLimitLabel: UILabel!
    
    @IBOutlet weak var limitProgress: UIProgressView!
    @IBOutlet weak var piggyProgress: UIProgressView!
    
    
    @IBOutlet weak var totalSummPiggy: UILabel!
    @IBOutlet weak var currentSummPiggy: UILabel!
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var upIncomeLabel: UILabel!
    @IBOutlet weak var downIcnomeLabel: UILabel!
    
    @IBOutlet weak var statisticLabel: UILabel!
    
    @IBOutlet weak var topUpPiggyButton: UIButton!
    @IBOutlet weak var topUpButton: UIButton!
    @IBOutlet weak var spendButton: UIButton!
    @IBOutlet weak var piggyStartOutlet: UIButton!
    
    @IBOutlet weak var chartView: PieChart!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCurentLimitView()
        setupPiggyView()
        setUIIcon()
        setupUI()
        notification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if RealmManager.read1().count > 0 {
            downIcnomeLabel.text = "\(RealmManager.read1()[0].spendMoney)"
        }
    }
    
    func setupCurentLimitView() {
        if DefaultsManager.createLimit {
            addCurentLimitView()
        } else {
            curentLimitView.isHidden = true
            
        }
        
    }
    func setupPiggyView() {
        
        if DefaultsManager.createPiggy {
            addPiggyView()
        } else {
            piggyView.isHidden = true
            
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
        piggyImage.image = UIImage.init(named: "ass-pig")
    }
    
    @IBAction func topUpButtonAction(_ sender: Any) {
    }
    
    @IBAction func topUpPiggyAction(_ sender: Any) {
        let spendPiggyVC = SpendPiggyVC(nibName: String(describing: SpendPiggyVC.self), bundle: nil)
        present(spendPiggyVC, animated: true)
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
    
    @IBAction func changeLimitAction(_ sender: Any) {
        let limit = CreateLimitVC(nibName: String(describing: CreateLimitVC.self), bundle: nil)
        present(limit, animated: true)
    }
    
    @IBAction func statisticAllAction(_ sender: Any) {
        tabBarController?.selectedIndex = 1
        
    }
    
    @IBAction func lookPiggyBankAction(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    
    func setupUI() {
        limitsView.layer.cornerRadius = 16
        curentLimitView.layer.cornerRadius = 16
        statisticView.layer.cornerRadius = 16
        createPiggyView.layer.cornerRadius = 16
        piggyView.layer.cornerRadius = 16
        
        topUpPiggyButton.layer.cornerRadius = 12
        topUpButton.layer.cornerRadius = 12
        spendButton.layer.cornerRadius = 12
        piggyStartOutlet.layer.cornerRadius = 12
        
        limitProgress.progressTintColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        
        let notificationImageTap = UITapGestureRecognizer(target: self, action: #selector(notificationImageDidTap))
        notificationImage.addGestureRecognizer(notificationImageTap)
        notificationImage.isUserInteractionEnabled = true
        
        let settingImageTap = UITapGestureRecognizer(target: self, action: #selector(settingImageDidTap))
        settingImage.addGestureRecognizer(settingImageTap)
        settingImage.isUserInteractionEnabled = true
        
        currentBalance.textColor = UIColor(cgColor: CGColor(red: 0.59, green: 0.6, blue: 0.64, alpha: 1.0))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.43
        nameProgectLabel.attributedText = NSMutableAttributedString(string: "easymo.", attributes: [NSAttributedString.Key.kern: 0.37, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    private func notification() {
        NotificationCenter.default.addObserver(self, selector: #selector(addCurentLimitView), name: .createLimit, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addPiggyView), name: .createPiggy, object: nil)
        
    }
    
    @objc func addCurentLimitView() {
        curentLimitView.isHidden = false
    }
    @objc func addPiggyView() {
        piggyView.isHidden = false
    }
    
}
extension DashBoard: Updaeble {
    func updataText(text: String) {
        
    }
    
    func changeTitleView(title: String) {
        
    }
    
    
    func updateViewColor(color: UIColor) {
        
    }
    
    
}
//let moneyPercent = Float(person.money * 100 / 3000) / 100
//moneyProgress.setProgress(moneyPercent, animated: true)
//
//salaryLabel.text = "Зарплата за день: \(person.salary) руб."
