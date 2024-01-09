//
//  BookPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/20.
//

import SwiftUI

struct BookPage: View {
    @State var inputText = ""
    
    var body: some View {
        
//        NavigationView {
            FoodAdditiveSelectList(inputText: $inputText)
//        }
//        .navigationViewStyle(.stack)
    }
}

#Preview {
    BookPage()
}
