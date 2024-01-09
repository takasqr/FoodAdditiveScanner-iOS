//
//  AnalyzerTest.swift
//  FoodAdditiveScannerTests
//
//  Created by takasqr on 2023/12/03.
//

import XCTest
@testable import FoodAdditiveScanner

final class AnalyzerTest: XCTestCase {
    
    func testAnalyze() {
        
        // 分析器をインスタンス化
        let analyzer = Analyzer()
        
        // 入力値を設定
        let text = "乳化剤"
//        let text = "リキッドスモーク"
        
        // 分析実行
        let results = analyzer.analyze(string: text)
        
        if results.count == 1 {
            XCTAssertEqual(results[0], text)
        } else {
            XCTFail("分析に失敗しました")
        }
    }
}
