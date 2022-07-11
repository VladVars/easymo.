//
//  LimitVC.swift
//  easymo.
//
//  Created by mac on 27.06.22.
//

import UIKit

class LimitVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var limitView: UIView!
    
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var summLabel: UILabel!
    @IBOutlet weak var totalsummLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuImage.image = UIImage.init(named: "ic...")
    }

}
