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

    func configureCell(summ: String, time: Date, category: String) {
        sumLabel.text = summ
        sumLabel.textColor = #colorLiteral(red: 0.8941176471, green: 0.07450980392, blue: 0.3215686275, alpha: 1)
        categorieLabel.text = category
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateLabel.text = formatter.string(from: time)
    }
    
}
