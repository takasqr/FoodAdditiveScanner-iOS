//
//  QAndAPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/14.
//

import SwiftUI

struct QAndAPage: View {
    
    struct QAndAItem: Identifiable {
        let id = UUID()
        let title: String
        let content: String
    }
    
    let qAndAList: [QAndAItem] = [
            QAndAItem(title: "指定添加物とは何ですか",
                      content: "指定添加物は日本の厚生労働省によって安全性が確認され、特定のリストに指定された食品添加物です。これらの添加物は、安全性評価を経て、使用が許可されています。それぞれの指定添加物は、使用基準や条件が設定されており、それに従って使用されます。"),
            QAndAItem(title: "既存添加物とは何ですか",
                      content: "既存添加物は、1959年以前から日本で広く使用されていた食品添加物で、当時の基準に基づいて「既に使用されている」とみなされたものです。これらの添加物に関しては、新たな安全性評価を経ていないものもあり、そのリストが作成されています。ただし、既存添加物も安全性が疑われる場合には、再評価が行われることがあります。")]

    var body: some View {
        
        ScrollView {
            ForEach(qAndAList) { item in
                Expander(title: item.title, content: item.content)
                    .padding(.top, 5)
                    .padding(.horizontal, 10)
            }
            .padding(.top, 15)
        }
        .navigationTitle("添加物Q&A")
    }
}

#Preview {
    QAndAPage()
}
