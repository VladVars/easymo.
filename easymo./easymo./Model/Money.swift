//
//  Money.swift
//  easymo.
//
//  Created by mac on 14.07.22.
//

import Foundation
import RealmSwift

@objc final class ReplenishMoney: Object {
//    SpendMoney
    @objc dynamic var replenishMoney: String = ""
    @objc dynamic var replenishTime: Date?
}

@objc final class Money: Object {
//    SpendMoney
    @objc dynamic var replenishMoney: String = ""
    @objc dynamic var spendMoney: String = ""
    @objc dynamic var spendTime: Date?
    @objc dynamic var category: String = ""
}

@objc final class Limit: Object {
//    Limt
    @objc dynamic var limit: String = ""
    @objc dynamic var limitTime: Date?
}

@objc final class PiggyBank: Object {
//    PiggyBank
    @objc dynamic var summPiggyBank: String = ""
    @objc dynamic var spendPiggyBank: String = ""
    @objc dynamic var namePiggyBank: String = ""

}
