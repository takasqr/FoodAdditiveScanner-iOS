//
//  FlatPrimaryButton.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/07.
//

import SwiftUI

struct FlatPrimaryButton: View {
    
    var image: String?
    
    var text: String

    var linearGradient: LinearGradient = LinearGradient(colors: [Color(red: 242/255, green: 44/255, blue: 133/255), Color(red: 164/255, green: 19/255, blue: 122/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        HStack {
            if let image = image {
                Image(systemName: image)
                    .foregroundColor(.black.opacity(0.7))
            }
            Text(text)
                .foregroundColor(.white)
                .bold()
        }
        .padding()
        .padding(.horizontal)
        .background(linearGradient)
        .cornerRadius(30)
        .shadow(radius: 0)
    }
}

struct FlatPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        FlatPrimaryButton(image: "person.fill", text: "認証する")
    }
}
