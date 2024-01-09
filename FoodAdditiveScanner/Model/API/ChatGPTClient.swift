//
//  ChatGPTClient.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/10.
//

import Foundation

class ChatGPTClient {
    private let apiClient = APIClient()
    private let apiKey: String
    private let endpoint = "https://api.openai.com/v1/chat/completions"

    init() {
        let key = Key()
        
        apiKey = key.get(key: "OPENAI_API_KEY") as! String
        
        print("KEY", apiKey)
    }
    
    func queryChatGPT(prompt: String) async throws -> String {
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]

        let requestBody: [String: Any] = [
            "model": "gpt-3.5-turbo", // Check for the latest model name
            "messages": [
                ["role": "system", "content": "以下の食品ラベルのOCRの結果から食品添加物のリストをJSONで返してください。"],
                ["role": "user", "content": prompt]
            ]
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid request body"])
        }
        
        do {
            let (data, _) = try await apiClient.post(urlString: endpoint, headers: headers, body: jsonData)
            
            // レスポンスデータを文字列に変換してログに記録
            if let responseString = String(data: data, encoding: .utf8) {
                print("API Response: \(responseString)")
            }
            
            if let responseDict = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let choices = responseDict["choices"] as? [[String: Any]],
               let firstChoice = choices.first,
               let message = firstChoice["message"] as? [String: Any],
               let text = message["content"] as? String {
                return text
            } else {
                throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response format"])
            }
        } catch {
            throw error
        }
    }
}
