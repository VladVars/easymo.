//
//  Money.swift
//  easymo.
//
//  Created by mac on 14.07.22.
//

import Foundation
import RealmSwift

@objc final class Money: Object {
//    SpendMoney
    @objc dynamic var spendMoney: Int = 0
    @objc dynamic var spendTime: Date?
    @objc dynamic var category: String = ""
    @objc dynamic var isSpendMoney: Bool = false
}

@objc final class Limit: Object {
//    Limt
    @objc dynamic var limit: Int = 0
    @objc dynamic var limitTime: Date?
}

@objc final class PiggyBank: Object {
//    PiggyBank
    @objc dynamic var imagePiggyBank: Data = Data()
    @objc dynamic var piggyTime: Date?
    @objc dynamic var summPiggyBank: Int = 0
    @objc dynamic var spendPiggyBank: Int = 0
    @objc dynamic var namePiggyBank: String = ""

}
