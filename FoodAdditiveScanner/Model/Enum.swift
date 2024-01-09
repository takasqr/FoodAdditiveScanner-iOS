//
//  Enum.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/10/29.
//

import Foundation

enum FoodAdditiveType {
    
    case none
    // 指定添加物
    case designated
    // 既存添加物
    case existing
    
    case mixed
    
    
    func toString() -> String {
        
        switch self {
        case .none:
            return "なし"
        case .designated:
            return "指定添加物"
        case .existing:
            return "既存添加物"
        case .mixed:
            return "一括"
        }
    }
    
    func toCoreData() -> String {
        
        switch self {
        case .none:
            return "none"
        case .designated:
            return "designated"
        case .existing:
            return "existing"
        case .mixed:
            return "mixed"
        }
    }
    
    static func fromCoreData(_ string: String) -> FoodAdditiveType {
        
        switch string {
        case "none":
            return .none
        case "designated":
            return .designated
        case "existing":
            return .existing
        case "mixed":
            return .mixed
        default:
            return .none
        }
    }
}

enum FoodAdditiveUsage {
    /// 未設定
    case none
    /// 保存料
    case preservative
    
    case flavorEnhancer
    
    case sweetener
    
    case emulsifier
    /// 香料
    case flavoringAgent
    /// 酸化防止剤
    case antioxidant
    
    case foodFortifier
    
    case foodProcessingAgent
    
    case thickeningAndStabilizingAgent
    
    case gumBase
    
    case yeastFood
    
    case foodColoring
    
    case leaveningAgent
    
    case acidulant
    
    case coagulantForTofu
    
    case bleachingAgent
    
    case bactericide
    
    case antimycoticAgent
    
    case coatingAgent
    
    case other(String)  // 他の用途をカスタムで指定する場合

    func toString() -> String {
        switch self {
        case .none:
            return "未設定"
        case .preservative:
            return "保存料"
        case .flavorEnhancer:
            return "調味料"
        case .sweetener:
            return "甘味料"
        case .emulsifier:
            return "乳化剤"
        case .other(let name):
            return name
        case .flavoringAgent:
            return "香料"
        case .antioxidant:
            return "酸化防止剤"
        case .foodFortifier:
            return "強化剤"
        case .foodProcessingAgent:
            return "製造用剤"
        case .thickeningAndStabilizingAgent:
            return "増粘安定剤"
        case .gumBase:
            return "ガムベース"
        case .yeastFood:
            return "イーストフード"
        case .foodColoring:
            return "着色料"
        case .leaveningAgent:
            return "膨脹剤"
        case .acidulant:
            return "酸味料"
        case .coagulantForTofu:
            return "豆腐用凝固剤"
        case .bleachingAgent:
            return "漂白剤"
        case .bactericide:
            return "殺菌料"
        case .antimycoticAgent:
            return "防かび剤"
        case .coatingAgent:
            return "被膜剤"
        }
    }
    
    func toCoreData() -> String {
        switch self {
        case .none:
            return "未設定"
        case .preservative:
            return "保存料"
        case .flavorEnhancer:
            return "調味料"
        case .sweetener:
            return "甘味料"
        case .emulsifier:
            return "乳化剤"
        case .other(let name):
            return name
        case .flavoringAgent:
            return "香料"
        case .antioxidant:
            return "酸化防止剤"
        case .foodFortifier:
            return "強化剤"
        case .foodProcessingAgent:
            return "製造用剤"
        case .thickeningAndStabilizingAgent:
            return "増粘安定剤"
        case .gumBase:
            return "ガムベース"
        case .yeastFood:
            return "イーストフード"
        case .foodColoring:
            return "着色料"
        case .leaveningAgent:
            return "膨脹剤"
        case .acidulant:
            return "酸味料"
        case .coagulantForTofu:
            return "豆腐用凝固剤"
        case .bleachingAgent:
            return "漂白剤"
        case .bactericide:
            return "殺菌料"
        case .antimycoticAgent:
            return "防かび剤"
        case .coatingAgent:
            return "被膜剤"
        }
    }
    
    static func fromCoreData(_ data: String) -> FoodAdditiveUsage {
        switch data {
        case "未設定":
            return .none
        case "保存料":
            return .preservative
        case "調味料":
            return .flavorEnhancer
        case "甘味料":
            return .sweetener
        case "乳化剤":
            return .emulsifier
        case "香料":
            return .flavoringAgent
        case "酸化防止剤":
            return .antioxidant
        case "強化剤":
            return .foodFortifier
        case "製造用剤":
            return .foodProcessingAgent
        case "増粘安定剤":
            return .thickeningAndStabilizingAgent
        case "ガムベース":
            return .gumBase
        case "イーストフード":
            return .yeastFood
        case "着色料":
            return .foodColoring
        case "膨脹剤":
            return .leaveningAgent
        case "酸味料":
            return .acidulant
        case "豆腐用凝固剤":
            return .coagulantForTofu
        case "漂白剤":
            return .bleachingAgent
        case "殺菌料":
            return .bactericide
        case "防かび剤":
            return .antimycoticAgent
        case "被膜剤":
            return .coatingAgent
        default:
            return .other(data)
        }
    }
    
    /// CoreData に格納するための String を返す
    static func getCoreDataString(_ input: [FoodAdditiveUsage]) -> String {
        
        var stringArray: [String] = []
        
        for usage in input {
            
            stringArray.append(usage.toCoreData())
        }
        
        return StringTool.convertArrayToJSONString(stringArray)
    }
    
    /// CoreData に入ってた String から [FoodAdditiveUsage] に戻す
    static func getArray(JSONString: String) -> [FoodAdditiveUsage] {
        
        let stringArray: [String] = StringTool.convertJSONStringToArray(jsonString: JSONString)
        
        var usageArray: [FoodAdditiveUsage] = []
        
        for string in stringArray {
            usageArray.append(FoodAdditiveUsage.fromCoreData(string))
        }
        
        return usageArray
    }
}

enum ValidationResult: Equatable {
    /// OK
    case valid
    /// データが空
    case dataIsEmpty(section: String)
    /// 文字数
    case lengthInvalid(section: String, min: Int, max: Int)
    /// 不明なエラー
    case unknownError
    /// 不正な値
    case invalidValue(section: String)
    /// 禁止文字
    case forbiddenCharacter(section: String)
    /// 桁数
    case digitCountMismatch(section: String, expected: Int)
    /// 高すぎ
    case overflow(section: String)
    /// 重複
    case duplicateEntry(section: String)
    /// カスタムエラー
    case custom(message: String)
    
    var isValid: Bool {
        switch self {
            
        case .valid:
            return true
        case .dataIsEmpty(section: _):
            return false
        case .lengthInvalid(section: _):
            return false
        case .unknownError:
            return false
        case .invalidValue(section: _):
            return false
        case .digitCountMismatch(section: _, expected: _):
            return false
        case .overflow(section: _):
            return false
        case .duplicateEntry(section: _):
            return false
        case .custom(message: _):
            return false
        case .forbiddenCharacter(section: _):
            return false
        }
    }
    
    var validationMessage: String {
        switch self {
            
        case .valid:
            return ""
        case .dataIsEmpty(section: let section):
            return "\(section)の入力がありません。"
        case .lengthInvalid(section: let section, let min, let max):
            return "\(section)の長さは\(min)以上\(max)以内である必要があります。"
        case .unknownError:
            return "未知のエラーが発生しました。"
        case .invalidValue(section: let section):
            return "\(section)が不正です。"
        case .digitCountMismatch(section: let section, expected: let expected):
            return "\(section)は\(expected)桁で入力してください。"
        case .overflow(section: let section):
            return "\(section)が高すぎます。"
        case .duplicateEntry(section: let section):
            return "\(section)は重複してはいけません。"
        case .custom(message: let message):
            return message
        case .forbiddenCharacter(section: let section):
            return "\(section)に禁止文字が含まれています。全角にするなどの対応をお願いします。"
        }
    }
}

enum CustomError: Error {
    case validationError(reason: String)
    case convertError(section: String)
    case databaseError(section: String)
    case authenticationError(reason: String)
    case networkError(reason: String)
    
    var title: String {
        switch self {
        case .validationError(reason: _):
            return "バリデーションエラー"
        case .convertError(section: _):
            return "変換エラー"
        case .databaseError(section: _):
            return "データベースエラー"
        case .authenticationError(reason: _):
            return "認証エラー"
        case .networkError(reason: _):
            return "ネットワークエラー"
        }
    }
    
    var message: String {
        switch self {
        case .validationError(reason: let reason):
            return "\(reason)"
        case .convertError(section: let section):
            return "\(section)の変換に失敗しました。"
        case .databaseError(section: let section):
            return "データベースの操作に失敗しました。\(section)"
        case .authenticationError(reason: let reason):
            return "アプリの認証に失敗しました。\(reason)"
        case .networkError(reason: let reason):
            return "ネットワークエラーが発生しました。\(reason)"
        }
    }
}
