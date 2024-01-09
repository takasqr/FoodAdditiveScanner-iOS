//
//  UserSetting.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/05.
//

import Foundation

struct UserSetting {
    
    private static let isSilentModeKey = "isSilentModeKey"
    
    static var isSilentMode: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isSilentModeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: isSilentModeKey)
        }
    }
}
