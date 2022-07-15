//
//  ReportVC.swift
//  easymo.
//
//  Created by mac on 2.07.22.
//

import UIKit

class ReportVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var summLabel: UILabel!
    @IBOutlet weak var spendView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spendView.layer.cornerRadius = 24
        
        
    }

   
    
}
