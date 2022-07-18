//
//  TopUpHistoryCell.swift
//  easymo.
//
//  Created by mac on 17.07.22.
//

import UIKit

class TopUpHistoryCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var categorieLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageCell.image = UIImage.init(named: "upIncome")

    }

    func configureCell(summ: String, time: Date, category: String = "Мой кошелек") {
        sumLabel.text = summ
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateLabel.text = formatter.string(from: time)
    
    }
    
}
