//
//  DefaulsManager.swift
//  easymo.
//
//  Created by mac on 14.07.22.
//

import Foundation

class DefaultsManager {
    private static let defaults = UserDefaults.standard

    static var loginPassword: Bool {
        get {
            return defaults.value(forKey: #function) as? Bool ?? false
        }
        set {
            defaults.set(newValue, forKey: #function)
        }
    }
    
    static var createLimit: Bool {
        get {
            return defaults.value(forKey: #function) as? Bool ?? false
        }
        set {
            defaults.set(newValue, forKey: #function)
        }
    }
    
    static var createPiggy: Bool {
        get {
            return defaults.value(forKey: #function) as? Bool ?? false
        }
        set {
            defaults.set(newValue, forKey: #function)
        }
    }
    static var faceID: Bool {
        get {
            return defaults.value(forKey: #function) as? Bool ?? false
        }
        set {
            defaults.set(newValue, forKey: #function)
        }
    }
    
//    static var isFirstLaunch: Bool {
//        get {
//            return defaults.value(forKey: #function) as? Bool ?? true
//        }
//        set {
//            defaults.set(newValue, forKey: #function)
//        }
//    }
}
