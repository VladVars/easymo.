//
//  ReportVC.swift
//  easymo.
//
//  Created by mac on 2.07.22.
//

import UIKit

class ReportVC: UIViewController {
    
    @IBOutlet weak var tableView1: UITableView!
    
    
    @IBOutlet weak var summLabel: UILabel!
    @IBOutlet weak var spendView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spendView.layer.cornerRadius = 24
    }
    override func viewWillAppear(_ animated: Bool) {
        update()
    }
   
}
extension ReportVC: Update {
    func update() {
        
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
            summLabel.text = "\(summSpend)"
        }
        
    }
    
    func updataText(text: String) {
        
    }
    
    func changeTitleView(title: String) {
        
    }
    
    
    func updateViewColor(color: UIColor) {
        
    }
    
    
}
