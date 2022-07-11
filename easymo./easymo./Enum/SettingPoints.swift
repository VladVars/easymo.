//
//  SettingPoints.swift
//  easymo.
//
//  Created by mac on 20.06.22.
//

import Foundation
import UIKit

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
