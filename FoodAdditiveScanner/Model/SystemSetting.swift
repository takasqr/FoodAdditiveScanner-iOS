//
//  SystemSetting.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/20.
//

import Foundation

/// アプリ内部で使う設定を管理する
struct SystemSetting {
    
    private static let dataVersionKey = "dataVersion"

    static var dataVersion: Int {
        get {
            return UserDefaults.standard.integer(forKey: dataVersionKey) 
        }
        set {
            UserDefaults.standard.set(newValue, forKey: dataVersionKey)
        }
    }
}
