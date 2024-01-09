//
//  APIClient.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/10.
//

import Foundation

class APIClient {
    func get(urlString: String, headers: [String: String] = [:]) async throws -> (Data, URLResponse) {
        let url: URL = URL(string: urlString)!
        var request = URLRequest(url: url)

        // Add headers to the request
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }

        // 返却用パラメータを初期化
        var returnData: Data = Data()
        var returnResponse: HTTPURLResponse = HTTPURLResponse()

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                // return "Error..."
                print("Error", response)
                return (Data(), response)
            }

            returnData = data
            returnResponse = httpResponse
        } catch {
            throw error
        }

        return (returnData, returnResponse)
    }
    
    func post(urlString: String, headers: [String: String] = [:], body: Data) async throws -> (Data, URLResponse) {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body

        // ヘッダーを追加
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }

        // 返却用パラメータを初期化
        var returnData: Data = Data()
        var returnResponse: HTTPURLResponse = HTTPURLResponse()

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  200...299 ~= httpResponse.statusCode else {
                print("Error: \(response)")
                return (Data(), response)
            }

            returnData = data
            returnResponse = httpResponse
        } catch {
            throw error
        }

        return (returnData, returnResponse)
    }
}
