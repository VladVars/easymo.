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
    
    static func read() -> [Money] {
        let result = realm.objects(Money.self)
        return Array(result)
    }
    
    static func save(object: Money) {
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
