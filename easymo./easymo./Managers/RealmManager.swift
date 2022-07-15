//
//  RealmManager.swift
//  easymo.
//
//  Created by mac on 14.07.22.
//

import Foundation
import RealmSwift


final class RealmManager {
    private static let realm = try! Realm()
    
    static func read1() -> [Money] {
        let result = realm.objects(Money.self)
        return Array(result)
    }
    static func read2() -> [Limit] {
        let result = realm.objects(Limit.self)
        return Array(result)
    }
    static func read3() -> [PiggyBank] {
        let result = realm.objects(PiggyBank.self)
        return Array(result)
    }
    
    static func save1(object: Money) {
       try? realm.write {
           realm.add(object)
        }
    }
    static func save2(object: Limit) {
       try? realm.write {
           realm.add(object)
        }
    }
    static func save3(object: PiggyBank) {
       try? realm.write {
           realm.add(object)
        }
    }
    
//    static func delete(object: Person) {
//        let data = read()
//        guard let objectToDelete = data.filter({ $0.name == object.name && $0.surname == object.surname && $0.phone == object.phone}).first else { return }
//
//        try? realm.write({
//            realm.delete(objectToDelete)
//        })
//    }
}
