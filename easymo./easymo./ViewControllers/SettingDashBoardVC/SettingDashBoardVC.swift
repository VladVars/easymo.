//
//  SettingDashBoardVC.swift
//  easymo.
//
//  Created by mac on 16.06.22.
//

import UIKit


class SettingDashBoardVC: UIViewController {
    @IBOutlet weak var settingTable: UITableView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    let settingsPoints = SettingPoints.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        settingTable.layer.cornerRadius = 14
        saveButton.layer.cornerRadius = 12
        
        settingTable.bounces = false
        
        settingTable.dataSource = self
        settingTable.delegate = self
        settingTable.register(UINib(nibName: String(describing: DashBoardSettingCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DashBoardSettingCell.self))
    }

    @IBAction func saveAction(_ sender: Any) {
    }
    
}
extension SettingDashBoardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsCell = tableView.dequeueReusableCell(withIdentifier: String(describing: DashBoardSettingCell.self), for: indexPath) as! DashBoardSettingCell
        settingsCell.setupCellWith(settingsPoints[indexPath.row])
        
        
        return settingsCell
    }
    
    
}
extension SettingDashBoardVC: UITableViewDelegate {
    
    
}
