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
        if categorieLabel.text == "Быт" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Платежи" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Продукты" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Одежда" {
            imageCell.image = UIImage.init(named: "ic-cloth")
        }
        if categorieLabel.text == "Траспорт" {
            imageCell.image = UIImage.init(named: "transport")
        }
        if categorieLabel.text == "Кафе" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Досуг" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Непредвиденные расходы" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Саморазвитие" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Авто" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        if categorieLabel.text == "Здоровье" {
            imageCell.image = UIImage.init(named: "upIncome")
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateLabel.text = formatter.string(from: time)
    }
    
}
