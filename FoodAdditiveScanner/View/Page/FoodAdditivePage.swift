//
//  FoodAdditivePage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/23.
//

import SwiftUI

struct FoodAdditivePage: View {
    
    let foodAdditive: FoodAdditive
    
    var linearGradient: LinearGradient = LinearGradient(colors: [Color(red: 242/255, green: 247/255, blue: 161/255), Color(red: 242/255, green: 44/255, blue: 133/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var shadowColor = Color(red: 255/255, green: 235/255, blue: 235/255)
        
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(foodAdditive.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black.opacity(0.6))
                    
                    Spacer()
                }
                
                HStack {
                    Text("タイプ：" + foodAdditive.type.toString())
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                HStack {
                    Text("効　果：" + foodAdditive.getUsageString())
                    
                    Spacer()
                }
                
                HStack {
                    Text("表示名：" + foodAdditive.getKeywordsString())
                    
                    Spacer()
                }
                
            }
            .padding(30)
            .background(linearGradient)
            .cornerRadius(30)
            .shadow(color: shadowColor, radius: 15)
            
            if foodAdditive.descriptionText.count > 0 {
                VStack {
                    ScrollView {
                        HStack {
                            Text(foodAdditive.descriptionText)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("by AIライター")
                                .foregroundColor(.gray.opacity(0.7))
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                        
                    }
                    
                    
                    HStack {
                        Spacer()
                        
                        TextButton("もっと調べる", "magnifyingglass")
                            .onTapGesture {
                                searchOnWeb(query: foodAdditive.name)
                            }
                    }
                }
                .padding(30)
                .background(.gray.opacity(0.1))
                .cornerRadius(30)
                .shadow(color: Color(red: 255/255, green: 235/255, blue: 235/255), radius: 15)
                
            }
            
            Spacer()
        }
        .padding(20)
    }
    
    private func searchOnWeb(query: String) {
        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let searchURL = URL(string: "https://www.google.com/search?q=\(encodedQuery)") {
            UIApplication.shared.open(searchURL)
        }
    }
}

//#Preview {
//    FoodAdditivePage()
//}
