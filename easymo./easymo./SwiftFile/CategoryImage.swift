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
        return UIImage.init(named: "house-hold")
    }
    if category == "Платежи" {
        return UIImage.init(named: "payments")
    }
    if category == "Продукты" {
        return UIImage.init(named: "food")
    }
    if category == "Одежда" {
        return UIImage.init(named: "ic-cloth")
    }
    if category == "Траспорт" {
        return UIImage.init(named: "transport")
    }
    if category == "Кафе" {
        return UIImage.init(named: "cafe")
    }
    if category == "Досуг" {
        return UIImage.init(named: "leisure")
    }
    if category == "Непредвиденные расходы" {
        return UIImage.init(named: "unforeseen")
    }
    if category == "Саморазвитие" {
        return UIImage.init(named: "self-development")
    }
    if category == "Авто" {
        return UIImage.init(named: "car")
    }
    if category == "Здоровье" {
        return UIImage.init(named: "health")
    }
    if category == "Мой кошелек" {
        return UIImage.init(named: "wallet")
    }
    return nil
}
