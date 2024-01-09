//
//  VideoScannerViewModel.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/07.
//

import Foundation
import UIKit

class VideoScannerViewModel: ObservableObject, OutputImageDelegate {
    
    var videoCaptureManager = VideoCaptureManager()
    
    var isTakePhoto = false
    
    @Published var result: [String] = []
    
    @Published var showResult = false
    
    init() {
        // delegate の下準備
        videoCaptureManager.delegate = self
    }
    
    /// 子クラスから画像を受け取るメソッド
    func outputImage(_ image: UIImage) {
        
        if isTakePhoto {
            
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
                    
                    // ChatGPT への問い合わせも同時に行う
//                    self.gpt(ocrText: result)
                    
                    // 結果を表示
                    // メインスレッドで実行
                    DispatchQueue.main.async {
                        self.result = foodAdditives
                        self.showResult = true
                    }
                    
                } else {
                    // OCRが失敗した場合
                    print("OCRが失敗しました。")
                }
            }
            
            // 元に戻す
            isTakePhoto = false
        }
    }
    
    /// ChatGPT に問い合わせる
    func gpt(ocrText: String) {
        
        let analyzer = Analyzer()
        
        analyzer.analyzeWithGPT(string: ocrText) { result in
            switch result {
            case .success(let additivesList):
                // 成功時: 取得した食品添加物のリストを処理
                print("食品添加物のリスト: \(additivesList)")
                // ここで、リストをUIに表示するか、他の処理を行う

                // 結果を表示
                // メインスレッドで実行
                DispatchQueue.main.async {
                    self.result = self.result + additivesList
                }
                
            case .failure(let error):
                // エラー時: エラーメッセージを表示またはログに記録
                print("エラーが発生しました: \(error)")
                // 必要に応じて、ユーザーにエラーを通知する
            }
        }
    }
    
    /// シャッtーボタンが押されたときの処理
    func takePhoto() {
        
        self.isTakePhoto = true
    }
}
