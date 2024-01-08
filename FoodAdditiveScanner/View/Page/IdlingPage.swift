//
//  IdlingPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/07.
//

import SwiftUI

struct IdlingPage: View {
    
    @State private var selectedMenu: String?
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                
                Menu {
                    
                    Button(action: {
                        selectedMenu = "List"
                    }) {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("添加物一覧")
                        }
                    }
                    
                    Button(action: {
                        selectedMenu = "Q&A"
                    }) {
                        HStack {
                            Image(systemName: "book")
                            Text("添加物Q&A")
                        }
                    }
                    
                    Button(action: {
                        selectedMenu = "Help"
                    }) {
                        HStack {
                            Image(systemName: "questionmark")
                            Text("アプリの使い方")
                        }
                    }
                    
                } label: {
                    
                    Image(systemName: "ellipsis.circle")
                        .resizable() // resizableを追加
                        .frame(width: 30, height: 30) // frameでサイズを指定
                        .foregroundColor(.gray)

                }
                .padding(.vertical, 30)
                .padding(.horizontal, 40)
                
                NavigationLink(destination: BookPage(), tag: "List", selection: $selectedMenu) {
                    // 何も表示しない
                }
                
                NavigationLink(destination: HelpPage(), tag: "Help", selection: $selectedMenu) {
                    // 何も表示しない
                }
                
                
                NavigationLink(destination: QAndAPage(), tag: "Q&A", selection: $selectedMenu) {
                    // 何も表示しない
                }
            }
            
           
            Spacer()
            
            Image("undraw_shopping_app_flsj")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                NavigationLink(destination: VideoScannerPage()) {
                    FlatPrimaryButton(text: "スキャン開始")
                }
                
            }
            .padding(.top, 40)
            
            VStack {
                VStack {
                    
                    HStack {
                        Text("このアプリの使い方")
                            .bold()
                        
                    }
                    
                    HStack {
                        Image(systemName: "1.circle")
                        
                        Text("「スキャン開始」をタップ")
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        Image(systemName: "2.circle")
                        
                        Text("食品表示をカメラで撮る")
                        
                        Spacer()
                    }
                    .padding(.top, 1)
                    
                    HStack {
                        Image(systemName: "3.circle")
                        
                        Text("スキャン結果を確認")
                        
                        Spacer()
                    }
                    .padding(.top, 1)
                    
                    Spacer()
                }
                .padding(30)
                .background(.gray.opacity(0.1))
                .cornerRadius(30)
                .shadow(color: Color(red: 255/255, green: 235/255, blue: 235/255), radius: 15)
            }
            .padding(30)
        }
    }
}

#Preview {
    IdlingPage()
}
