//
//  ScannerViewModel.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/05.
//

import Foundation
import UIKit

protocol OutputImageDelegate: AnyObject {
    func outputImage(_ image: UIImage)
}

class ScannerViewModel: ObservableObject, OutputImageDelegate {

    var cameraManager = CameraManager()
    
    @Published var videoCaptureManager = VideoCaptureManager()
    
    @Published var result: [String] = []
    
    @Published var showResult = false
    
    init() {
        // delegate の下準備
        cameraManager.delegate = self
    }
    
    /// 子クラスから画像を受け取るメソッド
    func outputImage(_ image: UIImage) {
        
        // OCR機能を持つインスタンスを作成
        let ocr = OCR()

        // OCRを実行し, 結果を取得
        ocr.performJapaneseOCR(image: image) { result in
            if let result = result {
                // OCRの結果が得られた場合
                print("認識結果: \(result)")
                
//                let splitResult = StringTool.split(result, by: [" ", "　", "/", "、", "。"])
//                
//                print(splitResult)
                
                let analyzer = Analyzer()
                
                let foodAdditives = analyzer.analyze(string: result)
                
                // 結果を表示
                self.result = foodAdditives
                self.showResult = true
                
            } else {
                // OCRが失敗した場合
                print("OCRが失敗しました。")
            }
        }
    }
}
