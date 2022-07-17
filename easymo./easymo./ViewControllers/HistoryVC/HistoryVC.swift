//
//  HistoryVC.swift
//  easymo.
//
//  Created by mac on 16.06.22.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var money = RealmManager.readMoney().self {
        didSet {
            tableView.reloadData()
        }
    }
    
    var replenish = RealmManager.readReplenishMoney().self {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: String(describing: ReportCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ReportCell.self))
        
        tableView.register(UINib(nibName: String(describing: TopUpHistoryCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TopUpHistoryCell.self))
    }



}

extension HistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replenish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let spendCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReportCell.self), for: indexPath) as! ReportCell
//
//        spendCell.configureCell(summ: RealmManager.readMoney()[indexPath.row].spendMoney,
//                           time: RealmManager.readMoney()[indexPath.row].spendTime!,
//                           category: RealmManager.readMoney()[indexPath.row].category)
//
//        return spendCell
        
        let replenishCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TopUpHistoryCell.self), for: indexPath) as! TopUpHistoryCell
        
        replenishCell.configureCell(summ: RealmManager.readReplenishMoney()[indexPath.row].replenishMoney,
                           time: RealmManager.readReplenishMoney()[indexPath.row].replenishTime!)
        
        return replenishCell
    }
    
    
}
extension HistoryVC: UITableViewDelegate {
    
}
