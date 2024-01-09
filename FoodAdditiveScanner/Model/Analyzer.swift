//
//  Analyzer.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/03.
//

import Foundation

class Analyzer {
    
    func analyze(string: String) -> [String] {
        return self.findFoodAdditives(text: string)
    }
    
    func analyze2(string: String) -> [String] {
        return self.findFoodAdditives2(text: string)
    }
    
    func analyzeWithGPT(string: String, completion: @escaping (Result<[String], Error>) -> Void) {
        let chatGPTClient = ChatGPTClient()

        Task {
            do {
                let prompt = "" + string
                
                // 入力されたstringを使用してChatGPTに問い合わせ
                let response = try await chatGPTClient.queryChatGPT(prompt: prompt)

                print("response", response)
                
                // JSON解析（仮定として、レスポンスがJSON文字列である場合）
                if let jsonResponse = self.extractArray(from: response) {
                    
                    // 文字列の配列から食品添加物を抜き出す
                    for string in jsonResponse {
                        
                        print(self.findFoodAdditive(in: FoodAdditive.getFoodAdditives(), with: string))
                    }
                    
                    completion(.success(jsonResponse))
                } else {
                    // JSON解析失敗の場合
                    completion(.failure(JSONError.decodingError))
                }
            } catch {
                // 通信エラーなどのエラーを処理
                completion(.failure(error))
            }
        }
    }

    enum JSONError: Error {
        case decodingError
    }
    
    /// 読み取り結果から食品添加物を検出する
    private func findFoodAdditives(text: String) -> [String] {
        
        let foodAdditives = FoodAdditive.getFoodAdditives()
        
        let names = getNames(foodAdditives)
    
        return names.filter { text.contains($0) }
    }
    
    ///
    private func getNames(_ foodAdditives: [FoodAdditive]) -> [String] {
        return foodAdditives.map { $0.name }
    }
    
    private func findFoodAdditives2(text: String) -> [String] {
        
        let foodAdditives = FoodAdditive.getFoodAdditives()
        
        let results = findFoodAdditive(in: foodAdditives, with: text)
        
        return results.map { $0.name }
        
    }
    
    private func findFoodAdditive(in additives: [FoodAdditive], with searchString: String) -> [FoodAdditive] {
        return additives.filter { $0.keywords.contains(where: { $0.contains(searchString) }) }
    }
    
    func extractArray(from jsonString: String) -> [String]? {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }

        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let array = jsonObject["食品添加物"] as? [String] {
                return array
            }
        } catch {
            print("JSON解析に失敗しました: \(error)")
        }

        return nil
    }
}
