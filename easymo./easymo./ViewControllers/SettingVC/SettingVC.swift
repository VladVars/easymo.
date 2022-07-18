//
//  SettingVC.swift
//  easymo.
//
//  Created by mac on 16.06.22.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var tableViewOne: UITableView!
    @IBOutlet weak var tableViewTwo: UITableView!
    
    var settingPointsOneTable = SettingPointsTableOne.allCases
    
    var settingPointsTwoTable = SettingPointsTableTwo.allCases
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOne.layer.cornerRadius = 14
        tableViewTwo.layer.cornerRadius = 14
        
        tableViewOne.dataSource = self
        tableViewOne.delegate = self
        tableViewTwo.dataSource = self
        tableViewTwo.delegate = self
        tableViewOne.tag = 0
        tableViewTwo.tag = 1
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9158933759, green: 0.2990999222, blue: 0.5363475084, alpha: 1)
        
        tableViewOne.register(UINib(nibName: String(describing: TableViewOneCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewOneCell.self))

        
        tableViewTwo.register(UINib(nibName: String(describing: TableViewTwoCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewTwoCell.self))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

extension SettingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0:
            return settingPointsOneTable.count
        case 1:
            return settingPointsTwoTable.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            
            let oneCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewOneCell.self), for: indexPath) as! TableViewOneCell
            oneCell.setupCellWith(settingPointsOneTable[indexPath.row])
            
            return oneCell
            
        } else {
            
            let twoCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewTwoCell.self), for: indexPath) as! TableViewTwoCell
            twoCell.setupCellWith(settingPointsTwoTable[indexPath.row])
            
            return twoCell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = #colorLiteral(red: 0.8983810544, green: 0.9182998538, blue: 0.9308556914, alpha: 1)

        if tableView.tag == 0 {
            
            if indexPath.row == 0 {
                let filter = SettingCurencyVC(nibName: String(describing: SettingCurencyVC.self), bundle: nil)
                navigationController?.pushViewController(filter, animated: true)
            } else if indexPath.row == 1 {
                let filter = StartMouthVC(nibName: String(describing: StartMouthVC.self), bundle: nil)
                navigationController?.pushViewController(filter, animated: true)
            } else {
                let filter = FudsVC(nibName: String(describing: FudsVC.self), bundle: nil)
                navigationController?.pushViewController(filter, animated: true)
            }
        } else {
            if indexPath.row == 0 {
                let filter = ParametrsInputVC(nibName: String(describing: ParametrsInputVC.self), bundle: nil)
                navigationController?.pushViewController(filter, animated: true)
            } else {
                
            }
        }
    
    }
    
}

