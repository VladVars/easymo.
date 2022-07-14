//
//  Money.swift
//  easymo.
//
//  Created by mac on 14.07.22.
//

import Foundation
import RealmSwift


@objc final class Money: Object {
    @objc dynamic var spendMoney: String = ""
    @objc dynamic var time: Date?
    @objc dynamic var replenishMoney: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var limit: String = ""
}
