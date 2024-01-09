//
//  OCR.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/10/29.
//

import Foundation
import Vision
import UIKit

struct OCR {

    func performJapaneseOCR(image: UIImage, completion: @escaping (String?) -> Void) {
        // 1. Visionリクエストの初期化
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("OCRエラー: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                completion(nil)
                return
            }
            
            var recognizedText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { continue }
                recognizedText += topCandidate.string + " "
            }
            
            completion(recognizedText)
        }
        
        // 2. Visionリクエストの設定
        request.recognitionLanguages = ["ja-JP"] // 日本語の認識を有効にする
        request.recognitionLevel = .accurate  // 認識の精度を設定
        
        // 3. UIImageからCIImageを生成
        guard let ciImage = CIImage(image: image) else {
            completion(nil)
            return
        }
        
        // 4. Visionリクエストの実行
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("リクエストの実行エラー: \(error.localizedDescription)")
            completion(nil)
        }
    }
}
