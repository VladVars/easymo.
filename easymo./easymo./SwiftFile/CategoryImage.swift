//
//  CategoryImage.swift
//  easymo.
//
//  Created by mac on 19.07.22.
//

import Foundation
import UIKit

func imageFromCategory(category: String) -> UIImage? {
    if category == "Быт" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Платежи" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Продукты" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Одежда" {
        return UIImage.init(named: "ic-cloth")
    }
    if category == "Траспорт" {
        return UIImage.init(named: "transport")
    }
    if category == "Кафе" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Досуг" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Непредвиденные расходы" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Саморазвитие" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Авто" {
        return UIImage.init(named: "upIncome")
    }
    if category == "Здоровье" {
        return UIImage.init(named: "upIncome")
    }
    return nil
}
