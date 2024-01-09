//
//  Key.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/10.
//

import Foundation

class Key {
    var property: Dictionary<String, Any> = [:]
    
    init() {
        // Pathを設定
        let path = Bundle.main.path(forResource: "Key", ofType: "plist")
        
        // 読み込み
        let configurations = NSDictionary(contentsOfFile: path!)
        if let datasourceDictionary: [String: Any] = configurations as? [String: Any] {
            property = datasourceDictionary
        }
    }

    func get(key: String) -> Any {
        return (property[key])
    }
}
