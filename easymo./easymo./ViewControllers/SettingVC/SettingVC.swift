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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOne.layer.cornerRadius = 14
        tableViewTwo.layer.cornerRadius = 14
        
        tableViewOne.dataSource = self
        tableViewOne.delegate = self
        tableViewTwo.dataSource = self
        tableViewTwo.delegate = self

    }

}

extension SettingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

