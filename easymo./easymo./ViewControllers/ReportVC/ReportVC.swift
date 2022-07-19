//
//  ReportVC.swift
//  easymo.
//
//  Created by mac on 2.07.22.
//

import UIKit

class ReportVC: UIViewController {
    
    @IBOutlet weak var tableView1: UITableView!
    
    var money = RealmManager.readMoney().self {
        didSet {
            tableView1.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView1.dataSource = self
        tableView1.delegate = self
        
        tableView1.register(UINib(nibName: String(describing: ReportCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ReportCell.self))
    }
    override func viewWillAppear(_ animated: Bool) {
        //        update()
    }
    
}
extension ReportVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return money.filter({!$0.isSpendMoney}).count
        } else {
            return money.filter({$0.isSpendMoney}).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let spendCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReportCell.self), for: indexPath) as! ReportCell
        
        if indexPath.section == 0 {
            let spend = money.filter({ !$0.isSpendMoney })
            spendCell.configureCell(item: spend[indexPath.row])
            
        } else if indexPath.section == 1 {
            let replenish = money.filter({ $0.isSpendMoney })
            spendCell.configureCell(item: replenish[indexPath.row])
            
        }
                
        return spendCell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Доходы"
        }
        return "Расходы"
        
    }
    
    
}

//extension ReportVC: Update {
//    func update() {
//
//        if RealmManager.readMoney().count > 0 {
//            var summSpend = 0
//            var summReplenish = 0
//
//            for item in RealmManager.readMoney() {
//                if item.isSpendMoney {
//                    summSpend += item.spendMoney
//                    summReplenish -= item.spendMoney
//                } else {
//                    summReplenish += item.spendMoney
//                }
//            }
//            summLabel.text = "\(summSpend)"
//        }
//
//    }
//
//}
