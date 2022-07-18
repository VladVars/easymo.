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
    
    @IBOutlet weak var statisticImage2: UIImageView!
    @IBOutlet weak var statisticImage3: UIImageView!
    @IBOutlet weak var statisticImage1: UIImageView!
    @IBOutlet weak var divider: UIImageView!
    
    
    @IBOutlet weak var namePiggy: UILabel!
    @IBOutlet weak var nameProgectLabel: UILabel!
    
    @IBOutlet weak var curentSummLimitLabel: UILabel!
    @IBOutlet weak var totalSummLimitLabel: UILabel!
    
    @IBOutlet weak var limitProgress: UIProgressView!
    @IBOutlet weak var piggyProgress: UIProgressView!
    
    @IBOutlet weak var category1: UILabel!
    @IBOutlet weak var category2: UILabel!
    @IBOutlet weak var category3: UILabel!

    @IBOutlet weak var categorySumm1: UILabel!
    @IBOutlet weak var categorySumm2: UILabel!
    @IBOutlet weak var categorySumm3: UILabel!
    
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
    
    func setupCategory() {
        let categorySet = Set(RealmManager.readMoney().filter({$0.isSpendMoney}).map({$0.category}))
        var array = [(category: String, summ: Int)]()
        let spendTransaction = RealmManager.readMoney().filter({$0.isSpendMoney})
        
        for item in categorySet {
            var summ = 0
            for transaction in spendTransaction {
                if transaction.category == item {
                    summ += transaction.spendMoney
                }
                
            }
            array.append((item, summ))
        }
        let sortedArray = array.sorted(by: {$0.summ > $1.summ})
        categorySumm1.text = spendTransaction
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        update()

    }
    
    func progressBar() {
        guard let totLimitSumm = Int(totalSummLimitLabel.text ?? "") else { return }
        guard let curLimitSumm = Int(curentSummLimitLabel.text ?? "") else { return }

        let moneyPercent = Float(curLimitSumm * 100 / totLimitSumm) / 100
        limitProgress.setProgress(moneyPercent, animated: true)
        
        if curLimitSumm >= totLimitSumm {
//            alert limit
        }
        
    }
    
    @objc func tapPiggy() {
        let cardPiggy = CardPiggyBankVC(nibName: String(describing: CardPiggyBankVC.self), bundle: nil)
        cardPiggy.curentSumm = currentSummPiggy
        cardPiggy.totalSumm = totalSummPiggy
        cardPiggy.namePiggy = namePiggy
        present(cardPiggy, animated: true)
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
        divider.image = UIImage.init(named: "divider")
        statisticUPImage.image = UIImage.init(named: "upIncome")
        statisticDownImage.image = UIImage.init(named: "downIncome")
        settingImage.image = UIImage.init(named: "SettingIcon")
        notificationImage.image = UIImage.init(named: "Notifications")
        piggyImage.image = UIImage.init(named: "ass-pig")
        
        statisticImage1.image = UIImage.init(named: "ic-cloth")
        statisticImage3.image = UIImage.init(named: "transport")
        
    }
    
    @IBAction func topUpButtonAction(_ sender: Any) {
        let replenishVC = ReplenishVC(nibName: String(describing: ReplenishVC.self), bundle: nil)
        replenishVC.delegate = self
        present(replenishVC, animated: true)
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
        let confirm = ConfirmationVC()
        let createPiggyBank = CreatePiggyBankVC(nibName: String(describing: CreatePiggyBankVC.self), bundle: nil)
        confirm.delegat = self
        present(createPiggyBank, animated: true)
    }
    
    @IBAction func changeLimitAction(_ sender: Any) {
        let limit = CreateLimitVC(nibName: String(describing: CreateLimitVC.self), bundle: nil)
        limit.delegate = self
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
        
        let tapPiggyView = UITapGestureRecognizer(target: self, action: #selector(tapPiggy))
        piggyView.addGestureRecognizer(tapPiggyView)
        
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
        namePiggy.text = "\(RealmManager.readPiggyBank()[0].namePiggyBank)"
        totalSummPiggy.text = "\(RealmManager.readPiggyBank()[0].summPiggyBank)"
    }
    
}
extension DashBoard: Update {
    func update() {
        if RealmManager.readLimit().count > 0 {
            totalSummLimitLabel.text = "\(RealmManager.readLimit()[0].limit)"
        }
        
        if RealmManager.readMoney().count > 0 {
            var summSpend = 0
            var summReplenish = 0
            
            for item in RealmManager.readMoney() {
                if item.isSpendMoney {
                    summSpend += item.spendMoney
                    summReplenish -= item.spendMoney
                } else {
                    summReplenish += item.spendMoney
                }
            }
            statisticLabel.text = "\(summSpend)"
            curentSummLimitLabel.text = "\(summSpend)"
            upIncomeLabel.text = "\(summReplenish)"
            downIcnomeLabel.text = "\(summSpend)"
            balance.text = "\(summReplenish)"
        }
        
        if RealmManager.readPiggyBank().count > 0 {
            namePiggy.text = "\(RealmManager.readPiggyBank()[0].namePiggyBank)"
            totalSummPiggy.text = "\(RealmManager.readPiggyBank()[0].summPiggyBank)"
        }
        progressBar()

        
    }
    
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
//upIncomeLabel.text = "\(RealmManager.readMoney().filter({!$0.isSpendMoney}).first?.spendMoney ?? 0)"
