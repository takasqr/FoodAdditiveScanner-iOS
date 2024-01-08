//
//  HelpPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/14.
//

import SwiftUI

struct HelpPage: View {
    struct HelpItem: Identifiable {
        let id = UUID()
        let title: String
        let content: String
    }
    
    let qAndAList: [HelpItem] = [
            HelpItem(
                title: "スキャン方法",
                content: "1. 「スキャン開始」をタップ\n2. 食品表示をカメラで撮る\n3. スキャン結果を確認"),
            HelpItem(
                title: "なぜ食品表示ラベルから添加物を抽出することができるのですか",
                content: "食品表示ラベルから添加物を抽出するために、画像から文字を認識するAI技術を使っています。")]

    var body: some View {
        
        ScrollView {
            ForEach(qAndAList) { item in
                Expander(title: item.title, content: item.content)
                    .padding(.top, 5)
                    .padding(.horizontal, 10)
            }
            .padding(.top, 15)
        }
        .navigationTitle("ヘルプ")
    }
}

#Preview {
    HelpPage()
}
