//
//  SettingCurencyVC.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class SettingCurencyVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var settingPoints = SettingPointsCurency.allCases

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Валюта"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 14
        
        tableView.register(UINib(nibName: String(describing: SettingCurencyCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SettingCurencyCell.self))
        
    }


}

extension SettingCurencyVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingCurencyCell.self), for: indexPath) as! SettingCurencyCell
        
        cell.setupCellWith(settingPoints[indexPath.row])
        
        return cell
    }
    
    
}
