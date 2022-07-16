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
        
        tableViewOne.register(UINib(nibName: String(describing: TableViewOneCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewOneCell.self))

        
        tableViewTwo.register(UINib(nibName: String(describing: TableViewTwoCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewTwoCell.self))
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
            
            if indexPath.row % 2 == 0 {
            
            }
            
            let twoCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewTwoCell.self), for: indexPath) as! TableViewTwoCell
            twoCell.setupCellWith(settingPointsTwoTable[indexPath.row])
            
            return twoCell
        }

    }
    
}

