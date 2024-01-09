//
//  ResultSheet.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/16.
//

import SwiftUI

struct ResultSheet: View {
    
    @Binding var result: [String]
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Text("スキャン結果")
                    .padding(.top, 30)
                
                if result.count == 0 {
                    Text("添加物は見つかりませんでした。")
                        .padding(.top, 30)
                }
                
                List(result, id: \.self) { item in
                    NavigationLink(destination: FoodAdditivePage(foodAdditive: FoodAdditive.get(name: item))) {
                        HStack {
                            Text(item)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    private func searchOnWeb(query: String) {
        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let searchURL = URL(string: "https://www.google.com/search?q=\(encodedQuery)") {
            UIApplication.shared.open(searchURL)
        }
    }
}

//#Preview {
//    ResultSheet()
//}
