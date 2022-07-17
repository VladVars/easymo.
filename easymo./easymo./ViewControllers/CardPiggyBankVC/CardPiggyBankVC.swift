//
//  CardPiggyBankVC.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class CardPiggyBankVC: UIViewController {
    
    @IBOutlet weak var piggyImage: UIImageView!
    
    @IBOutlet weak var curentSumm: UILabel!
    @IBOutlet weak var totalSumm: UILabel!
    @IBOutlet weak var namePiggy: UILabel!
    
    @IBOutlet weak var cangeButton: UIButton!
    @IBOutlet weak var replenishButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cangeButton.layer.cornerRadius = 12
        replenishButton.layer.cornerRadius = 12

    }

    @IBAction func replenishAction(_ sender: Any) {
        let spendPiggyVC = SpendPiggyVC(nibName: String(describing: SpendPiggyVC.self), bundle: nil)
        present(spendPiggyVC, animated: true)
    }
    
    
    @IBAction func cangeAction(_ sender: Any) {
        
    }
    

}
