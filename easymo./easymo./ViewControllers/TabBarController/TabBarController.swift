//
//  TabBarController.swift
//  easymo.
//
//  Created by mac on 15.06.22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.9158933759, green: 0.299099952, blue: 0.5363475084, alpha: 1)
        
        setupControllers()
    }
    private func setupControllers() {
        let dashBoardVC = DashBoard(nibName: String(describing: DashBoard.self), bundle: nil)
        let segmentVC = SegmentVC(nibName: String(describing: SegmentVC.self), bundle: nil)
        let piggyBankVC = PiggyBankVC(nibName: String(describing: PiggyBankVC.self), bundle: nil)
        let settingVC = UINavigationController(rootViewController: SettingVC(nibName: String(describing: SettingVC.self), bundle: nil) )
        
        dashBoardVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage.init(named: "home"), tag: 0)
        segmentVC.tabBarItem = UITabBarItem(title: "Отчет", image: UIImage.init(named: "report"), tag: 1)
        piggyBankVC.tabBarItem = UITabBarItem(title: "Копилка", image: UIImage.init(named: "piggy"), tag: 2)
        settingVC.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage.init(named: "union"), tag: 3)
        
        self.viewControllers = [dashBoardVC, segmentVC, piggyBankVC, settingVC]
    }

}
