//
//  SettingPoints.swift
//  easymo.
//
//  Created by mac on 20.06.22.
//

import Foundation
import UIKit
import RealmSwift

enum SettingPoints: CaseIterable {
    case limits
    case statistics
    case piggyBank
    
    var settingText: String {
        switch self {
        case .limits:
            return "Лимиты"
        case .statistics:
            return "Статистика"
        case .piggyBank:
            return "Копилка"
        }
    }
    
    var settingImage: UIImage? {
        switch self {
        case .limits:
            return UIImage(named: "Vector")
        case .statistics:
            return UIImage(named: "Vector")
        case .piggyBank:
            return UIImage(named: "Vector")
        }

    }
}

enum SettingPointsTableOne: CaseIterable {
    case currency
    case startMounth
    case funds
    
    
    var settingText: String {
        switch self {
        case .currency:
            return "Валюта"
        case .startMounth:
            return "Начало месяца"
        case .funds:
            return "Поступления средств"
        }
    }
    
    var settingImage: UIImage? {
        switch self {
        case .currency:
            return UIImage(named: "text")
        case .startMounth:
            return UIImage(named: "text-2")
        case .funds:
            return UIImage(named: "text-3")
        }
    }
}

enum SettingPointsTableTwo: CaseIterable {
    case parametrInput
    case notification
    
    var settingText: String{
        switch self {
        case .parametrInput:
            return "Параметры входа"
        case .notification:
            return "Push-уведомления"
        }
    }
    
    var settingImage: UIImage? {
        switch self {
        case .parametrInput:
            return UIImage(named: "right")
        case .notification:
            return nil
        }
    }
}

enum SettingPointsCurency: CaseIterable {
    case byn
    case dollar
    case euro
    case rudl
    
    var settingText: String {
        switch self {
        case .byn:
            return "BYN Белорусский рубль"
        case .dollar:
            return "$ Dollar"
        case .euro:
            return "€ Euro"
        case .rudl:
            return "₽ Рубль"
        }
    }
    
    var settingImage: UIImage? {
        switch self {
        case .byn:
            return UIImage(named: "ic-checkmark")
        case .dollar:
            return UIImage(named: "ic-checkmark")
        case .euro:
            return UIImage(named: "ic-checkmark")
        case .rudl:
            return UIImage(named: "ic-checkmark")
        }
    }
}
