//
//  ReportCell.swift
//  easymo.
//
//  Created by mac on 2.07.22.
//

import UIKit

class ReportCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var categorieLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    func configureCell(item: Money) {
        
        sumLabel.text = "\(item.spendMoney)"
        if item.isSpendMoney {
            sumLabel.textColor = #colorLiteral(red: 0.8941176471, green: 0.07450980392, blue: 0.3215686275, alpha: 1)
        } else {
            sumLabel.textColor = #colorLiteral(red: 0.1058823529, green: 0.7294117647, blue: 0.431372549, alpha: 1)
        }
        categorieLabel.text = item.category
        imageCell.image = imageFromCategory(category: item.category)
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        guard let date = item.spendTime else { return }
        dateLabel.text = formatter.string(from: date)
    }
    
}
