//
//  StringTool.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/02.
//

import Foundation

struct StringTool {
    
    /// 分割したいキー文字の配列を受け取り、String を分割して返す
    static func split(_ input: String, by separators: [String]) -> [String] {
        var result = [input]
        for separator in separators {
            result = result
                .flatMap { $0.components(separatedBy: separator) }
                .filter { !$0.isEmpty }
        }
        return result
    }
    
    static func convertArrayToJSONString(_ array: [String]) -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: array, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            }
        } catch {
            print("Error converting array to JSON string: \(error)")
        }
        return "[]"
    }
    
    static func convertJSONStringToArray(jsonString: String) -> [String] {
        do {
            if let jsonData = jsonString.data(using: .utf8),
               let array = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String] {
                return array
            }
        } catch {
            print("Error converting JSON string to array: \(error)")
        }
        return []
    }
}
